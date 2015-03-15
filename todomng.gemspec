# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todomng/version'

Gem::Specification.new do |spec|
  spec.name          = "todomng"
  spec.version       = TodoMng::VERSION
  spec.authors       = ["Shogo Watanabe"]
  spec.email         = ["ne.sheep.5mouths@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Todo management tool}
  spec.description   = %q{todo management tool}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pry"
  spec.add_dependency "activerecord", "~>3.2.0"
  spec.add_dependency "sqlite3", "~>1.3.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "redcarpet", "~> 2.2"
end
