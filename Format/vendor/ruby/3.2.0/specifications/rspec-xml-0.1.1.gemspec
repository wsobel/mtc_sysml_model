# -*- encoding: utf-8 -*-
# stub: rspec-xml 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-xml".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Carper".freeze]
  s.date = "2015-03-02"
  s.description = "One simple matcher for now".freeze
  s.email = ["dcarper@dreamagile.com".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Spec your XML".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<turnip>.freeze, [">= 0"])
  s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
end
