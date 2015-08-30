# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml-web-driver/version'

Gem::Specification.new do |spec|
  spec.name          = 'yaml-web-driver'
  spec.version       = YamlWebDriver::VERSION
  spec.authors       = ['James Leskovar']
  spec.email         = ['jleskovar@gmail.com']

  spec.summary       = %q{YAML-driven web driver}
  spec.homepage      = 'https://github.com/jleskovar/yaml-web-driver'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = 'ywd'
  spec.require_paths = ['lib']

  spec.add_dependency 'watir-webdriver'
  spec.add_dependency 'headless'
  spec.add_dependency 'page-object'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
