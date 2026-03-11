require 'active_support/inflector'
require 'uri'
require 'cgi'

module GhPagesHelpers
  module Definitions
    @definitions = {}
    def self.add(context, definitions)
      @definitions[context] = definitions
    end

    def self.[](context)
      @definitions[context]
    end

    def self.dig(*terms)
      @definitions.dig(*terms)
    end
  end

  def convert_macro(value, expand = true)
    if value =~ /([a-zA-Z0-9_]+)(\(([^\)]+)\))?/
      command = $1
      args = $3.gsub(/\\([<>])/, '\1') if $3
      
      #puts "Macro: #{command} (#{args})"

      case command         
      when 'term'
        format_term(args, false, expand)
        
      when 'termplural'
        format_term(args, true, expand)

      when 'operation'
        format_operation(args)

      when 'block'
        format_block(args)

      when 'property'
        format_property(args)

      when 'package'
        format_package(args)

      when 'def'
        text = GhPagesHelpers::Definitions.dig(*args.split('::')) || "`#{args}`"
        convert_markdown(text)

      when 'latex'
        args

      when 'table'
        # puts "Table Reference #{args} = #{num}"
        "*Table #{args}*"

      when 'figure'
        # puts "Image Reference #{args} = #{num}"            
        "*Figure #{args}*"

      when "span", "colspan"
        ''

      when "rowspan"
        ''

      when "sect"
        "*Section #{args}*"

      when "input"
        ''

      when 'cite', 'citetitle'
        if args =~ /MTCPart([0-9])/
          target = case $1
                    when '1'
                      'Protocols'
                      
                    when '2'
                      'Device Information Model'

                    when '3'
                      'Observation Information Model'

                    when '4'
                      'Asset Information Model'

                    when '5'
                      'Interface Interaction Model'

                    else
                      "MTConnect Part #{$1}"
                    end

          format_package(target)
        else
          "<em>#{args}</em>"
        end
        
      when 'markdown'
        args

      when 'url'
        if cp = args.index(':')
          ref = args
          text = args[(cp + 1)..]
        else
          ref = "https://#{args}"
          text = args
        end
        "[#{text}](#{ref})"
        
      else
        args
        
      end
    else
      ''
    end
  end

  def convert_markdown(content, expand = true)
    content.gsub(/\{\{(.+?)\}\}/) do |m|
      convert_macro(m, expand)
    end.gsub(%r{\((figures/[^.]+\.(?:png|jpg|jpeg|svg))}) do |m|
      link = URI.decode_uri_component($1)
      if File.exist?(File.join($model_dir, link))
        "({% link #{link} %}"
      else
        $logger.warn "Cannot find linked file #{link}, skipping"
        "({% link figures/mtconnect.png %}"
      end
    end.gsub(/\{: width="([0-9.]+)"\}/) do |m|
      "{: width=\"#{$1.to_f * 100}%\"}"
    end
  end

  def table_cell_markdown(content)
    content = convert_markdown(content, true)
    content.split(/\r?\n/).map { |l| l.strip }.join("<br/>")
  end

  def prior_version(version)
    if version > '2.0'
      maj, min = version.split('.').map { |s| s.to_i }
      "#{maj}.#{min - 1}"
    else
      nil
    end
  end
      
  def format_version_link(version, path, text = version)
    if version >= '2.0'
      %{[#{text}](https://model.mtconnect.org/Version#{version}/#{path.sub(/\.md$/,'')}/)}
    else
      text
    end
  end

  def find_block(name)
    # Handle part property chains    
    if name.include?('::')
      package, name = name.split('::')
      model = GhPagesModel.model_for_name(package)  
      block =  model.types.find { |t| t.name == name } if model
    else
      block = GhPagesType.type_for_name(name)
    end

    return block
  end

  def format_target(ref = nil)
    sub = "::#{ref}" if ref
    display = "`#{@name}#{sub}`"

    if page_path and File.exist?(expanded_page_path)
      index = "##{ref}" if ref
      "[#{display}]({% link #{page_path} %}#{index})"
    end
  end

  def format_block(block)
    if LazyPointer === block
      block.resolve
      block = block.obj
    end
    
    if Type === block
      b = block
    else
      name = block.respond_to?(:name) ? block.name : block
      b = find_block(name)
    end
    if b
      %{[`#{b.name}`]({% link #{b.page_path} %})}
    else
      "`#{block}`"
    end                    
  end

  def format_property(property)
    # TODO: Handle property chains like `Device::data_items::name`
    f1, f2, f3, = property.split('::')
    b  = nil
    if f3
      b, prop = find_block("#{f1}::#{f2}"), f3
    elsif f2
      b, prop = find_block(f1), f2
    else
      prop = f1
    end

    if b
      %{[`#{b.name}::#{prop}`]({% link #{b.page_path} %}##{prop})}
    else
      "`#{property}`"
    end
  end

  def format_package(package)
    if b = GhPagesModel.model_for_name(package)
      b.format_target
    else
      "`#{package}`"                
    end                    
  end
  
  def format_term(term, plural = false, expand = true)
    display = plural ? ActiveSupport::Inflector.pluralize(term) : term
    if expand and t = GhPagesType.term_for_name(term) and not t.documentation.empty?
      body = convert_markdown(t.documentation.definition, false).gsub(/\s+/, ' ')
      %{<span class="hoverterm">#{display}<span markdown="1" class="definition" data-term="#{term}">#{body}</span></span>}
    else
      "*#{display}*"
    end
  end

  def format_operation(name)
    operation, block, package = name.split('::').reverse
    if package
      model = GhPagesModel.model_for_name(package)
      type = model.types.find { |t| t.name == block } if model
    else
      type = GhPagesType.type_for_name(name)
    end

    op = type.operations.find { |o| o.name == operation } if type
    if op
      model.format_target(op.name)
    else
      "`#{block}::#{operation}`"
    end
  end

  def write_table(f, columns, rows, options)
    # Write theader
    if options[:auto_width]
      tclass = ' class="auto-width"'
    end
    f.puts "<table#{tclass}><thead><th>#{columns.map(&:to_s).join('</th><th>')}</th></thead>"

    template = ''
    columns.each_with_index do |c, i|
      open = ''
      close = ''
      attrs = ''
      if col_opts = options[c]
        code = col_opts[:code]
        if code
          open = '<code>'
          close = '</code>'
          col_opts.delete(:code)
        end
        markdown = col_opts[:markdown]
        attrs = ' ' + col_opts.map { |k, v| %{#{k}="#{v}"} }.join() unless col_opts.empty?
        close = open = "\n" if markdown
      end
      if code
        template << "<td#{attrs}>#{open}\#{CGI.escapeHTML(r[#{i}].to_s)}#{close}</td>"      
      else
        template << "<td#{attrs}>#{open}\#{r[#{i}]}#{close}</td>"      
      end
    end

    lambda = eval "lambda { |r| %{#{template}} }"
    id = columns.index(options[:id]) if options[:id]

    # Write the body
    f.puts "  <tbody>"
    rows.each do |row|
      if id
        v = row[id].gsub(/<[^>]+>/, '')
        attrs = %{ id="#{v}"}
      end
      f.puts "      <tr#{attrs}>#{lambda.call(row)}</tr>"
    end
    f.puts "</tbody></table>"
  end

  def quote_yaml(text)
    return nil if text.nil?
    text.to_s.include?('"') ? "'#{text}'" : "\"#{text}\""
  end
end
