# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/cube7/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-cube7"
  spec.version       = Omniauth::Cube7::VERSION
  spec.authors       = ["Ruo"]
  spec.email         = ["siera04@gmail.com"]
  spec.description   = "Cube7 strategy for Omniauth"
  spec.summary       = "Cube7 strategy for Omniauth"
  spec.homepage      = "https://github.com/siera26/omniauth-cube7"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
