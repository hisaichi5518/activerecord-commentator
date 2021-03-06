# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/commentator/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-commentator"
  spec.version       = ActiveRecord::Commentator::VERSION
  spec.authors       = ["hisaichi5518"]
  spec.email         = ["hisaichi5518@gmail.com"]

  spec.summary       = %q{adds `caller_location` as SQL comment}
  spec.description   = %q{ActiveRecord::Commentator adds execute location (filename, line-number and method-name) as SQL comment that invokes SQL statement.}
  spec.homepage      = "https://github.com/hisaichi5518/activerecord-commentator"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1.6'

  spec.add_runtime_dependency "activerecord", ">= 4.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end
