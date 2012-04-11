# -*- encoding: utf-8 -*-
require File.expand_path("../lib/mongoid-minitest/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Francesco Rodriguez"]
  gem.email         = ["lrodriguezsanc@gmail.com"]
  gem.description   = %q{Minitest matchers for Mongoid}
  gem.summary       = %q{Minitest matchers for Mongoid}
  gem.homepage      = "https://github.com/frodsan/mongoid-minitest"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mongoid-minitest"
  gem.require_paths = ["lib"]
  gem.version       = Mongoid::MiniTest::VERSION

  gem.add_dependency "minitest", "~> 2.12.0"
  gem.add_dependency "mongoid" , "~> 2.4.7"
  gem.add_development_dependency "bson_ext", "~> 1.6.1"
  gem.add_development_dependency "guard-minitest"
  gem.add_development_dependency "rake", "~> 0.9.2"
end
