# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'japonica/version'

Gem::Specification.new do |spec|
  spec.name          = "japonica"
  spec.version       = Japonica::VERSION
  spec.authors       = ["ryands"]
  spec.email         = ["ryan@ryands.org"]
  spec.description   = %q{CLI tool for generating email orderforms for yahoo and mbok auctions with japonica}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
