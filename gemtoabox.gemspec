# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemtoabox/version'

Gem::Specification.new do |spec|
  spec.name          = "gemtoabox"
  spec.version       = Gemtoabox::VERSION
  spec.authors       = ["yuri-karpovich"]
  spec.email         = ["spoonest@gmail.com"]

  spec.summary       = %q{Uploads gems from your Gemfile to your own private rubygems hosting}
  spec.description   = %q{This gem provides the ability to backup your project gems to the private rubygem hosting on remote or local machine.
All you need is to specify path to your project Gemfile. }
  spec.homepage      = "https://github.com/yuri-karpovich/gemtoabox"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.2', '>= 3.2.0'
  spec.add_dependency "geminabox", '~> 0.13', '>= 0.13.0'
  spec.add_dependency "trollop", '~> 2.1', '>= 2.1.2'
end
