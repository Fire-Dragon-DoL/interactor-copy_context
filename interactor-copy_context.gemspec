# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interactor/copy_context/version'

Gem::Specification.new do |spec|
  spec.name          = "interactor-copy_context"
  spec.version       = Interactor::CopyContext::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]
  spec.summary       = %q{Copy context on specified object's instance variables}
  spec.description   = %q{Copy context on specified object's instance variables to allow easier interaction with returned values}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec",   "~> 2.14.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"

  spec.add_dependency "interactor", "~> 2.1"
end
