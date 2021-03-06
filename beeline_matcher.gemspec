# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beeline_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = "beeline_matcher"
  spec.version       = BeelineMatcher::VERSION
  spec.authors       = ["Vilyan01"]
  spec.email         = ["bheller2010@live.com"]

  spec.summary       = %q{Tools to match parsed JSON files with ingredients to items in Beeline's DB}
  spec.description   = %q{Uses the NYTimes' CRF toolset to parse an ingredient list into a JSON structure that we can then map to Beeline's DB.  Requires Python and libcrf++}
  spec.homepage      = "https://github.com/Vilyan01/BeelineMatcher"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"
end
