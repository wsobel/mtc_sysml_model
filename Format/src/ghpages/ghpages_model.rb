require 'model'
require 'ghpages/ghpages_type'
require 'ghpages/ghpages_diagram'

class GhPagesModel < Model
  @@output_dir = nil
  @@generator  = nil

  def self.output_dir=(dir)
    @@output_dir = dir
  end

  def self.output_dir
    @@output_dir
  end

  def self.type_class
    GhPagesType
  end

  def self.diagram_class
    GhPagesDiagram
  end

  def self.generator_class=(g)
    @@generator = g
  end

  def generator
    @@generator
  end

  # Top-level package ordering (matches portal)
  TOP_ORDER = [
    'Fundamentals',
    'Device Information Model',
    'Observation Information Model',
    'Asset Information Model',
    'Interface Interaction Model',
    'Profile',
    'Glossary',
    'Examples'
  ].freeze

  def self.generate_pages
    $logger.info "Generating GhPages markdown"

    # Write root index
    root_index = File.join(@@output_dir, 'index.md')
    File.open(root_index, 'w') do |f|
      f.puts "---"
      f.puts "title: MTConnect"
      f.puts "nav_order: 1"
      f.puts "has_children: true"
      f.puts "layout: default"
      f.puts "---"
      f.puts "\n# MTConnect\n"
    end

    # Gather top-level packages (direct children of the MTConnect root)
    top_level = @@models.values.select do |m|
      m.parent && (m.parent.name == 'MTConnect' || m.parent.name.nil?)
    end

    top_level.sort_by { |m| TOP_ORDER.index(m.name) || TOP_ORDER.length }.each_with_index do |model, i|
      model.generate_page(nil, i + 2)
    end
  end

  # Generate markdown pages for this model and recursively for children/types
  # parent_title  - Just-the-Docs `parent:` value (nil for top-level pages)
  # nav_order     - position in the navigation
  # grand_parent  - Just-the-Docs `grand_parent:` value (for depth >= 3)
  def generate_page(parent_title, nav_order, grand_parent = nil)
    dir = page_dir
    FileUtils.mkdir_p(dir)

    has_children = !public_types.empty? || !@children.empty?

    File.open(File.join(dir, 'index.md'), 'w') do |f|
      write_frontmatter(f, @name, parent_title, nav_order, has_children, grand_parent)
      f.puts "\n# #{@name}\n"
      write_documentation(f)
    end

    $logger.info "Generated page for #{@name}"

    # Child packages
    ordered_children = @children.sort_by { |c| c.name }
    ordered_children.each_with_index do |child, i|
      child.generate_page(@name, i + 1, parent_title)
    end

    # Types within this package
    ordered_types = public_types.sort_by { |t| t.name }
    ordered_types.each_with_index do |type, i|
      type.generate_page(dir, ordered_children.length + i + 1, @name, parent_title)
    end
  end

  private

  def public_types
    @types
  end

  # Build the output directory path by walking ancestors
  def page_dir
    parts = []
    m = self
    while m && m.name != 'MTConnect'
      parts.unshift(slug(m.name))
      m = m.parent
    end
    File.join(@@output_dir, *parts)
  end

  def slug(name = @name)
    name.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/^-|-$/, '')
  end

  def write_frontmatter(f, title, parent, nav_order, has_children, grand_parent = nil)
    f.puts "---"
    f.puts "title: #{quote_yaml(title)}"
    f.puts "parent: #{quote_yaml(parent)}" if parent
    f.puts "grand_parent: #{quote_yaml(grand_parent)}" if grand_parent
    f.puts "nav_order: #{nav_order}"
    f.puts "has_children: true" if has_children
    f.puts "layout: default"
    f.puts "---"
  end

  def write_documentation(f)
    return if @documentation.nil? || @documentation.empty?
    @documentation.sections.each do |section|
      if section.title == 'Definition'
        f.puts "\n#{section.text}\n"
      else
        f.puts "\n**#{section.title}**\n\n#{section.text}\n"
      end
    end
  end

  def quote_yaml(text)
    return nil if text.nil?
    text.to_s.include?('"') ? "'#{text}'" : "\"#{text}\""
  end
end
