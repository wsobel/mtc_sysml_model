require 'active_support/inflector'
require 'uri'

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


  def page_path
    # relative to the Jekyll root (model dir)
    parts = []
    m = model
    while m && m.name != 'MTConnect'
      parts.unshift(m.slug)
      m = m.parent
    end
    parts << "#{slug}.md"
    File.join('model', *parts)
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
      if File.exist?(File.join(File.dirname(__FILE__), '..', '..', 'docs', link))
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
      
  def format_version_link(name, version, text = version)
    if version >= '2.0'
      ref = "##{id}" if id
      %{[#{text}](https://model.mtconnect.org/versions/#{version}/#{name.downcase.gsub(/\s+/, '-')})}
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

  def format_target
    return format_block(@name)
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
      format_block(b) + "::`#{prop}`"
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
      body = convert_markdown(t.documentation.definition, false)
      %{<span class="hoverterm">#{display}<span class="definition" data-term="#{term}">#{body}</span></span>}
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
      op.format_target
    else
      "`#{block}::#{operation}`"
    end
  end
end
