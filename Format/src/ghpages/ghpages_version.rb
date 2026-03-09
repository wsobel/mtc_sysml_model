require 'ghpages/helpers'

class GhPagesVersion
  include GhPagesHelpers

  def self.generate_versions(dir, order)
    ver_dir = File.expand_path(File.join(dir, 'Versions'))
    FileUtils.mkdir_p(ver_dir)
    File.open(File.join(ver_dir, 'index.md'), 'w') do |f|
      f.puts <<EOT
---
title: "Versions"
nav_order: #{order}
has_children: true
layout: default
---

# Versions

EOT
    end

    one_x_versions = %w{1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8}
    maj, min = $mtconnect_version.split('.').map(&:to_i)
    versions = one_x_versions + (0..min).map { |v| "#{maj}.#{v}" }
    rows = versions.each_with_index do |version, i|
      version = GhPagesVersion.new(ver_dir, version, i)
      version.generate
    end
  end

  def initialize(dir, version, nav_order)
    @dir, @version, @nav_order = dir, version, @nav_order
  end

  def generate
    File.open(File.join(@dir, "Version#{@version}.md"), 'w') do |f|
      write_frontmatter(f)
      write_versioned(f)
    end
  end

    def write_frontmatter(f)
      f.puts <<EOT
---
title: "Version #{@version}"
nav_order: #{@nav_order}
parent: "Versions"
layout: default
---

# Version #{@version}

EOT
  end


  def write_versioned(file)
    $logger.info "Collecting changes for #{@version}"

    rows = Stereotype.stereotypes(:mtc).map do |id, sts|
      sts.find do |st|
        if st.name == 'normative' or st.name == 'deprecated'
          reason, = [:introduced, :updated, :deprecated, :version].map do |m|
            v = st.send(m) if st.respond_to?(m)
            if v and v.include?(@version)
              if m == :version
                case st.name
                when 'normative'
                  'introduced'
                when 'deprecated'
                  'deprecated'
                end
              else
                m.to_s
              end
            end
          end.compact
          if reason
            o = LazyPointer.new(st.id)
            if o.resolve
              break [st, reason.capitalize, o.obj]
            else
              $logger.error "Version resolution: Cannot find object for #{st.id} #{st} #{reason}"
              nil
            end
          end
        end
      end
    end.compact.map do |st, reason, obj|
      row = case obj
            when GhPagesType
              subject = obj
              name = obj.name
              t = case obj.type
                  when 'uml:Stereotype'
                    'Stereotype'

                  when 'uml:Enumeration'
                    'Enumeration'
                    
                  else
                    'Block'
                  end
              [ reason, t, "#{obj.format_target}" ]
              
            when Relation::Relation
              owner = obj.owner
              subject = owner
              name = owner.name + obj.name
              f = obj.deprecated ? "<strike>#{obj.name}</strike>" : obj.name
              t = Relation::Attribute === obj ? 'Property' : 'Relation'
              [ reason, t, "#{owner.format_target} #{f}" ]
              
            when Type::Literal
              owner = obj.owner
              subject = owner
              name = owner.name + obj.name
              f = obj.deprecated ? "<strike>#{obj.name}</strike>" : obj.name
              [ reason, 'Literal', "#{owner.format_target} <code>#{f}</code>"]
              
            when Operation
              block = obj.owner
              subject = block
              name = block.name + obj.name
              [ reason, 'Operation', "#{block.format_target(obj.name)}" ]
              
            when Operation::Parameter
              owner = obj.owner
              subject = owner
              block = owner.owner
              name = block.name + owner.name + obj.name
              f = obj.deprecated ? "<strike>#{obj.name}</strike>" : obj.name
              [ reason, 'Parameter', "#{block.format_target(owner.name)}(#{f})" ]
              
            else
              $logger.warn "Cannot find info for #{obj.class} #{obj.name}"
              nil
            end
      if row
        if row[0] == 'Updated' and @version > '2.0'and prior = prior_version(@version)
          row[0] = "Updated (Previous: #{format_version_link(prior, subject.page_path)})"
        end
        [name, row ]
      end
    end.compact.sort_by { |name, row| name }.map { |name, row| row }

    write_table(file, [:Change, :Type, :Entity], rows, 
                { Change: { markdown: 'block'}, Entity: { markdown: 'block'}})
  end

end