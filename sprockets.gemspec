# -*- encoding: utf-8 -*-
# stub: sprockets 2.2.3.backport2 ruby lib

Gem::Specification.new do |s|
  s.name = "sprockets"
  s.version = "2.2.3.backport2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sam Stephenson", "Joshua Peek"]
  s.date = "2016-02-26"
  s.description = "Sprockets is a Rack-based asset packaging system that concatenates and serves JavaScript, CoffeeScript, CSS, LESS, Sass, and SCSS."
  s.email = ["sstephenson@gmail.com", "josh@joshpeek.com"]
  s.executables = ["sprockets"]
  s.files = ["LICENSE", "README.md", "bin/sprockets", "lib/rake/sprocketstask.rb", "lib/sprockets.rb", "lib/sprockets/asset.rb", "lib/sprockets/asset_attributes.rb", "lib/sprockets/base.rb", "lib/sprockets/bundled_asset.rb", "lib/sprockets/cache/file_store.rb", "lib/sprockets/caching.rb", "lib/sprockets/charset_normalizer.rb", "lib/sprockets/closure_compressor.rb", "lib/sprockets/compressing.rb", "lib/sprockets/context.rb", "lib/sprockets/directive_processor.rb", "lib/sprockets/eco_template.rb", "lib/sprockets/ejs_template.rb", "lib/sprockets/engines.rb", "lib/sprockets/environment.rb", "lib/sprockets/errors.rb", "lib/sprockets/index.rb", "lib/sprockets/jst_processor.rb", "lib/sprockets/manifest.rb", "lib/sprockets/mime.rb", "lib/sprockets/paths.rb", "lib/sprockets/processed_asset.rb", "lib/sprockets/processing.rb", "lib/sprockets/processor.rb", "lib/sprockets/safety_colons.rb", "lib/sprockets/sass_cache_store.rb", "lib/sprockets/sass_compressor.rb", "lib/sprockets/sass_functions.rb", "lib/sprockets/sass_importer.rb", "lib/sprockets/sass_template.rb", "lib/sprockets/scss_template.rb", "lib/sprockets/server.rb", "lib/sprockets/static_asset.rb", "lib/sprockets/trail.rb", "lib/sprockets/uglifier_compressor.rb", "lib/sprockets/utils.rb", "lib/sprockets/version.rb", "lib/sprockets/yui_compressor.rb"]
  s.homepage = "http://getsprockets.org/"
  s.rubyforge_project = "sprockets"
  s.rubygems_version = "2.4.8"
  s.summary = "Rack-based asset packaging system"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hike>, ["~> 1.2"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.0"])
      s.add_runtime_dependency(%q<tilt>, ["!= 1.3.0", "~> 1.1"])
      s.add_development_dependency(%q<coffee-script>, ["~> 2.0"])
      s.add_development_dependency(%q<coffee-script-source>, ["~> 1.2.0"])
      s.add_development_dependency(%q<eco>, ["~> 1.0"])
      s.add_development_dependency(%q<ejs>, ["~> 1.0"])
      s.add_development_dependency(%q<execjs>, ["~> 1.0"])
      s.add_development_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<hike>, ["~> 1.2"])
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<rack>, ["~> 1.0"])
      s.add_dependency(%q<tilt>, ["!= 1.3.0", "~> 1.1"])
      s.add_dependency(%q<coffee-script>, ["~> 2.0"])
      s.add_dependency(%q<coffee-script-source>, ["~> 1.2.0"])
      s.add_dependency(%q<eco>, ["~> 1.0"])
      s.add_dependency(%q<ejs>, ["~> 1.0"])
      s.add_dependency(%q<execjs>, ["~> 1.0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<hike>, ["~> 1.2"])
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<rack>, ["~> 1.0"])
    s.add_dependency(%q<tilt>, ["!= 1.3.0", "~> 1.1"])
    s.add_dependency(%q<coffee-script>, ["~> 2.0"])
    s.add_dependency(%q<coffee-script-source>, ["~> 1.2.0"])
    s.add_dependency(%q<eco>, ["~> 1.0"])
    s.add_dependency(%q<ejs>, ["~> 1.0"])
    s.add_dependency(%q<execjs>, ["~> 1.0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
