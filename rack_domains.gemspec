# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack_domains/version"

Gem::Specification.new do |s|
  s.name        = "rack_domains"
  s.version     = RackDomains::VERSION
  s.authors     = ["Michael Hellein"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{TODO: A domain-based router for Rack}
  s.description = %q{TODO: A domain-based router for Rack}

  # s.rubyforge_project = "rack_domains"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "rack"
  s.add_development_dependency "rspec"
end
