# -*- encoding: utf-8 -*-
require File.expand_path '../lib/mongoid-minitest/version', __FILE__

Gem::Specification.new do |gem|
  gem.authors       = ['Francesco Rodriguez', 'Sascha Wessel']
  gem.email         = ['lrodriguezsanc@gmail.com']
  gem.description   = %q{Minitest matchers for Mongoid}
  gem.summary       = %q{Minitest matchers for Mongoid}
  gem.homepage      = 'https://github.com/frodsan/mongoid-minitest'

  gem.files         = Dir.glob('{lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename f }
  gem.test_files    = gem.files.grep %r{^(test|spec|features)/}
  gem.name          = 'mongoid-minitest'
  gem.require_paths = ['lib']
  gem.version       = Mongoid::MiniTest::VERSION

  gem.add_dependency 'minitest', '~> 3.3.0'
  gem.add_dependency 'minitest-matchers', '~> 1.2.0'
  gem.add_dependency 'mongoid' , '~> 3.0.4'
  gem.add_development_dependency 'rake'
end
