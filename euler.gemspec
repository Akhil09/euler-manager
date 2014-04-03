# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'euler/version'

Gem::Specification.new do |spec|
  spec.name          = 'euler'
  spec.version       = Euler::VERSION
  spec.authors       = ['William Yaworsky']
  spec.email         = ['wj.px01@gmail.com']
  spec.summary       = %q{Manage and test project Euler problems from your command line.}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fakefs', '~> 0.5.2'

  spec.add_development_dependency 'nokogiri'
end
