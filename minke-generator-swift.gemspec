# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generators/swift/version'

Gem::Specification.new do |spec|
  spec.name          = "minke-generator-swift"
  spec.version       = Minke::Generators::Swift::VERSION
  spec.authors       = ["Nic Jackson"]
  spec.email         = ["jackson.nic@gmail.com"]

  spec.summary       = %q{Swift Kitura framework generator for Minke}
  spec.description   = %q{Swift Kitura framework with MySQL generator for Minke}
  spec.homepage      = "https://github.com/nicholasjackson/minkie-generator-swift"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # required so minke knows to load the gem which then registers itself
  spec.metadata = { 'entrypoint' => 'generators/swift' }

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
