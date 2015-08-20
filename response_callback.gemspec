# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'response_callback/version'

Gem::Specification.new do |spec|
  spec.name          = "response_callback"
  spec.version       = ResponseCallback::VERSION
  spec.authors       = ["Gabriel Torello"]
  spec.email         = ["gabriel128@gmail.com"]

  spec.summary       = %q{ Response callback to deal with success and failures.}
  spec.description   = %q{ A gem to use on_success and on_fail messages to deal
                           with final states of an operation.}
  spec.homepage      = "https://github.com/gabriel128/response_callback"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
