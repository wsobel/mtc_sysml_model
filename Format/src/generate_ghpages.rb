$: << File.dirname(__FILE__)

require 'fileutils'
require 'ghpages/ghpages_model'

class GhPagesGenerator

  def initialize(xmi)
    @xmi = xmi
    @skip_models = Set["CSV Imports",
                       "Simulation",
                       "MTConnect",
                       "Development Process",
                       "Imports",
                       "Supporting Documents"
    ]
  end

  def self.model_class
    GhPagesModel
  end

  def generate
    dir = File.expand_path(File.join('..', '..', 'model'), File.dirname(__FILE__))
    FileUtils.mkdir_p(dir)

    $logger.info "Generating GhPages documentation in #{dir}"

    GhPagesModel.generator_class = self
    GhPagesModel.skip_models = @skip_models
    GhPagesModel.output_dir = dir

    Stereotype.collect_stereotypes(@xmi)

    @top = GhPagesModel.new(nil, @xmi)
    @top.find_data_types
    @top.find_definitions

    GhPagesModel.generate_pages
  end

end
