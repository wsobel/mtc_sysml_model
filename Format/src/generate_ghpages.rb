$: << File.dirname(__FILE__)

require 'fileutils'
require 'ghpages/ghpages_model'
require 'ghpages/ghpages_version'

class GhPagesGenerator

  def initialize(xmi)
    @xmi = xmi
    @skip_models = Set["CSV Imports",
                       "Simulation",
                       "MTConnect",
                       "Development Process",
                       "Imports",
                       "Supporting Documents",
                       "MTConnect Device Validation Suite"
    ]
  end

  def self.model_class
    GhPagesModel
  end

  def generate
    dir = File.expand_path(File.join('..', '..', 'build', "Version#{$mtconnect_version}"), File.dirname(__FILE__))
    FileUtils.mkdir_p(dir)
    unless File.exist?(File.join(dir, 'figures'))
      FileUtils.ln_s(File.join($model_dir, 'figures'), File.join(dir, 'figures'))
    end

    File.open(File.join(dir, '_config_version.yml'), 'w') do |f|
      f.puts "title: MTConnect SysML Model V#{$mtconnect_version}"
      f.puts "comment_url: #{ENV['COMMENT_URL'] || 'https://projects.mtconnect.org/cameo_comment'}"
    end

    $logger.info "Generating GhPages documentation in #{dir}"

    GhPagesModel.generator_class = self
    GhPagesModel.skip_models = @skip_models
    GhPagesModel.output_dir = dir

    Stereotype.collect_stereotypes(@xmi)

    @top = GhPagesModel.new(nil, @xmi)
    @top.find_data_types
    @top.find_definitions

    order = GhPagesModel.generate_pages

    GhPagesVersion.generate_versions(dir, order + 1)
  end

end
