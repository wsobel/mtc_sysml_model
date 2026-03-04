require 'type'

class GhPagesType < Type
  def generate_page(output_dir, nav_order, parent_title, grand_parent = nil)
    return if @name =~ /Factory/ || @visibility != 'public'
    return if @type == 'uml:Association'

    filename = File.join(output_dir, "#{slug}.md")
    File.open(filename, 'w') do |f|
      write_frontmatter(f, nav_order, parent_title, grand_parent)
      f.puts "\n# #{escape_md(@name)}\n"
      write_documentation(f)
      write_stereotypes(f)
      write_version_info(f)
      write_parents(f)
      write_relations(f)
      write_enumerations(f) if enumeration?
      write_operations(f)
    end
  end

  def slug
    @name.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/^-|-$/, '')
  end

  private

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
      f.puts "\n**#{section.title}**\n\n#{section.text}\n" unless section.title == 'Definition'
      f.puts "\n#{section.text}\n" if section.title == 'Definition'
    end
  end

  def write_stereotypes(f)
    return unless @stereotypes && !@stereotypes.empty?
    visible = @stereotypes.reject { |s| ['normative', 'deprecated'].include?(s.name) }
    return if visible.empty?
    f.puts "\n**Stereotypes:** #{visible.map { |s| "`<<#{s.name}>>`" }.join(', ')}\n"
  end

  def write_version_info(f)
    intro = introduced
    dep = deprecated
    return unless intro || dep
    f.puts "\n| Version Info | |\n|---|---|\n"
    f.puts "| Introduced | #{intro} |\n" if intro
    f.puts "| Deprecated | #{dep} |\n" if dep
  end

  def write_parents(f)
    return if @parents.nil? || @parents.empty?
    names = @parents.map { |p| "`#{p.name}`" }.join(', ')
    f.puts "\n**Supertype:** #{names}\n"
  end

  def write_relations(f)
    public_rels = @relations.select do |r|
      r.type != 'uml:Constraint' &&
        r.visibility == 'public' &&
        r.name != 'Supertype'
    end
    return if public_rels.empty?

    f.puts "\n## Properties\n"
    f.puts "\n| Name | Type | Int | Dep | Multiplicity | Description |\n|---|---|---|---|---|---|\n"
    public_rels.each do |r|

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
        type_name = r.final_target.type.name
      rescue
        type_name = ''
      end
      name = "~`#{name}`~" if dep
      mult = r.multiplicity rescue ''
      doc = r.documentation.to_s.gsub(/\s+/, ' ').strip rescue ''
      if doc.empty? && r.respond_to?(:association_doc)
        doc = r.association_doc.to_s.gsub(/\s+/, ' ').strip
      end
      f.puts "| #{name} | `#{type_name}` | #{int} | #{dep} | #{mult} | #{doc} #{text} |\n"
    end
  end

  def write_enumerations(f)
    return if @literals.nil? || @literals.empty?
    f.puts "\n## Enumeration Literals\n"
    f.puts "\n| # | Literal | Int | Dep | Upd | Description |\n|---|---|---|---|---|---|\n"
    literals.sort_by { |lit| lit.name }.map.with_index do |lit, i|
      f.puts "| #{i + 1} | `#{lit.name}` | #{lit.introduced} | #{lit.deprecated} | #{lit.updated} | #{lit.description.to_s.gsub(/\s+/, ' ').strip} |\n"
    end
  end

  def write_operations(f)
    return if @operations.nil? || @operations.empty?
    f.puts "\n## Operations\n"
    @operations.each do |op|
      f.puts "\n### `#{op.name}`\n"
      f.puts "\n#{op.documentation}\n" unless op.documentation.to_s.empty?
    end
  end

  def escape_md(text)
    text.to_s
  end

  def quote_yaml(text)
    text.to_s.include?('"') ? "'#{text}'" : "\"#{text}\""
  end
end
