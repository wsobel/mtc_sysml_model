require 'type'
require 'ghpages/helpers'

class GhPagesType < Type
  include GhPagesHelpers

  def initialize(model, e)
    super

    lits = literals
    unless lits.empty?
      definitions = Hash.new
      lits.sort_by { |lit| lit.name }.each do |lit|
        definitions[lit.name] = lit.description.definition
      end

      GhPagesHelpers::Definitions.add(@name, definitions)
    end
  end

  def generate_page(output_dir, nav_order, parent_title, grand_parent = nil)
    return if @name =~ /Factory/ || @visibility != 'public'
    return if @type == 'uml:Association'

    filename = File.join(output_dir, "#{slug}.md")
    File.open(filename, 'w') do |f|
      write_frontmatter(f, nav_order, parent_title, grand_parent)
      f.puts "\n# #{@name}"
      write_documentation(f)
      write_stereotypes(f)
      write_version_info(f)
      write_parents(f)
      write_relations(f)
      write_enumerations(f) if enumeration?
      write_operations(f)
      write_constraints(f)
    end
  end

  def slug
    @name.gsub(/[^a-z0-9]+/i, '')
  end

  def write_frontmatter(f, nav_order, parent_title, grand_parent)
    f.puts "---"
    f.puts "title: #{quote_yaml(@name)}"
    f.puts "parent: #{quote_yaml(parent_title)}" if parent_title
    f.puts "grand_parent: #{quote_yaml(grand_parent)}" if grand_parent
    f.puts "nav_order: #{nav_order}"
    f.puts "layout: default"
    f.puts "---"
  end

  def write_documentation(f)
    return if @documentation.nil? || @documentation.empty?
    @documentation.sections.each do |section|
      f.puts "\n**#{section.title}**" unless section.title == 'Definition'
      f.puts "\n#{convert_markdown(section.text)}"
    end
  end

  def write_stereotypes(f)
    return unless @stereotypes && !@stereotypes.empty?
    visible = @stereotypes.reject { |s| ['normative', 'deprecated'].include?(s.name) }
    return if visible.empty?
    f.puts "\n**Stereotypes:** #{visible.map { |s| "`<<#{s.name}>>`" }.join(', ')}"
  end

  def write_version_info(f)
    intro = introduced
    dep = deprecated
    return unless intro || dep
    if updated
      upd = updated.dup
      if prior = prior_version(updated)
        upd << " (Previous: #{format_version_link(@name, prior, prior)})"
      end
    end

    f.puts "\n## Version Info"
    f.puts "\n| Introduced | Deprecated | Updated |"
    f.puts "|---|---|---|"
    f.puts "| #{intro} | #{dep} |  #{upd} |"
  end

  def write_parents(f)
    return if @parents.nil? || @parents.empty?
    names = @parents.map { |p| "`#{p.name}`" }.join(', ')
    f.puts "\n**Supertype:** #{names}"
  end

  def wrte_relation(f, r)
    ints, deps = [introduced], [deprecated]
    ints << r.introduced
    deps << r.deprecated
    
    text = ''
    if Relation::Association === r
      assoc = r.association
      ints << assoc.introduced
      deps << assoc.deprecated

      if r.thru?
        inter = r.target.type
        text << " (through `#{inter.name}`)"
      end
    end
    
    if r.target
      ints << r.target.introduced
      ints << r.target.type.introduced
      deps << r.target.deprecated
      deps << r.target.type.deprecated
    end

    if r.name == 'subType' or r.name == 'type' and not r.read_only
      if r.default
        text << "An unspecified `#{r.name}` **MUST** default to `#{r.default}`."
      elsif r.multiplicity == '1'
        text << "The `#{r.name}` **MUST** be specified"
      end
    end

    int = ints.compact.max
    dep = deps.compact.max

    name = r.respond_to?(:association_name) && r.association_name ? r.association_name : r.name
    begin
      if r.final_target && r.final_target.type
        if r.final_target.type.type == 'uml:Class' or r.final_target.type.type == 'uml:Enumeration'
          page = r.final_target.type.page_path rescue nil
        end
      end
      if page
        type_name = %{<a href="{% link #{page} %}"><code>#{r.final_target.type.name}</code></a>}
      elsif r.final_target && r.final_target.type
        type_name = "<code>#{r.final_target.type.name}</code>"
      elsif r.final_target
        type_name = "<code>#{r.final_target.type.name}</code>"
      else
        type_name = r.target ? "<code>#{r.target.name}</code>" : 'Unknown'
      end
      # puts "Type: #{type_name} for #{r.name} in #{self.name}"
    rescue
      puts "Error finding type for relation #{r.name} in #{self.name}: #{$!} #{$!.backtrace.join("\n")}"
      type_name = 'Unknown'
    end
    name = "<code>#{name}</code>"
    if dep
      name = "<s>#{name}</s>" 
    end
    mult = r.multiplicity rescue ''
    doc = r.documentation
    if r.association_doc && !r.association_doc.empty?
      doc = "#{doc}\n#{r.association_doc}"
    end
    content = convert_markdown("#{doc} #{text}")
    f.puts %{<tr><td>#{name}</td><td>#{type_name}</td><td>#{int}</td><td>#{dep}</td><td>#{mult}</td>\n<td markdown="block">\n\n#{content}\n\n</td>\n</tr>}
  end

  def write_relations(f)
    public_rels = @relations.select do |r|
      r.type != 'uml:Constraint' &&
        r.visibility == 'public' &&
        r.name != 'Supertype'
    end
    return if public_rels.empty?

    relations, properties = public_rels.partition do |r|
      r.target && r.target.type.type == 'uml:Class'
    end

    unless properties.empty?
      f.puts "\n## Properties"
      f.puts "\n<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>"
      properties.each do |r|
        wrte_relation(f, r)
      end
      f.puts "</tbody></table>"
    end

    unless relations.empty?
      f.puts "\n## Relations"
      f.puts "\n<table><thead><tr><th>Name</th><th>Type</th><th>Int</th><th>Dep</th><th>Multiplicty</th><th>Description</th></tr></thead><tbody>"
      relations.each do |r|
        wrte_relation(f, r)
      end
      f.puts "\n</tbody></table>"
    end
  end

  def write_enumerations(f)
    return if @literals.nil? || @literals.empty?
    f.puts "\n## Enumeration Literals"
    f.puts "\n| # | Literal | Int | Dep | Upd | Description |\n|---|---|---|---|---|---|"
    literals.sort_by { |lit| lit.name }.map.with_index do |lit, i|
      content = convert_markdown(lit.description.to_s.gsub(/\s+/, ' ').strip)
      f.puts "| #{i + 1} | `#{lit.name}` | #{lit.introduced} | #{lit.deprecated} | #{lit.updated} | #{content} |"
    end
  end

  def write_operations(f)
    return if @operations.nil? || @operations.empty?
    f.puts "\n## Operations"
    @operations.each do |op|
      f.puts "\n### `#{op.name}`"
      #content = convert_markdown(op.description.to_s.gsub(/\s+/, ' ').strip)
      #f.puts "\n#{content}"
    end
  end

  def write_constraints(f)
    return if @constraints.empty?

    $logger.debug "Adding constraints to #{@name}"
    f.puts "\n## Constraints"

    f.puts "\n<table><thead><tr><th>Error Message</th><th>OCL Expression</th></tr></thead><tbody>"
    @constraints.each do |c|
      f.puts "\n<tr><td markdown=\"block\">\n\n#{convert_markdown(c.documentation)}\n\n</td><td markdown=\"block\">\n\n```\n#{c.ocl}\n```\n\n</td></tr>"
    end
    f.puts "\n</tbody></table>"
  end

  def quote_yaml(text)
    text.to_s.include?('"') ? "'#{text}'" : "\"#{text}\""
  end  
end
