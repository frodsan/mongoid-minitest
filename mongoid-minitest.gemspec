# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mongoid-minitest/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Francesco Rodriguez']
  gem.email         = ['lrodriguezsanc@gmail.com']
  gem.description   = %q{Minitest matchers for Mongoid}
  gem.summary       = %q{Minitest matchers for Mongoid}
  gem.homepage      = 'https://github.com/frodsan/mongoid-minitest'

  gem.files         = Dir.glob('{lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'mongoid-minitest'
  gem.require_paths = ['lib']
  gem.version       = Mongoid::MiniTest::VERSION

  gem.required_ruby_version = '1.9.3'

  gem.add_dependency 'minitest', '~> 3.3.0'
  gem.add_dependency 'mongoid' , '~> 3.0.2'
  gem.add_development_dependency 'rake'
end
