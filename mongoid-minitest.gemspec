# -*- encoding: utf-8 -*-
require File.expand_path '../lib/mongoid-minitest/version', __FILE__

Gem::Specification.new do |gem|
  gem.name          = 'mongoid-minitest'
  gem.version       = Mongoid::MiniTest::VERSION

  gem.authors       = ['Francesco Rodriguez', 'Sascha Wessel', 'Godfrey Chan']
  gem.email         = ['lrodriguezsanc@gmail.com']
  gem.description   = %q{MiniTest matchers for Mongoid}
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/frodsan/mongoid-minitest'
  gem.licenses      = ['MIT']

  gem.files            = `git ls-files`.split "\n"
  gem.executables      = `git ls-files -- bin/*`.split("\n").map{|f| File.basename f }
  gem.test_files       = `git ls-files -- test/*`.split "\n"
  gem.extra_rdoc_files = ['CHANGELOG.md', 'LICENSE.md', 'README.md']
  gem.rdoc_options     = ['--charset=UTF-8']
  gem.require_paths    = ['lib']

  gem.add_dependency 'minitest', '~> 4.1'
  gem.add_dependency 'minitest-matchers', '~> 1.2'
  gem.add_dependency 'mongoid' , '~> 3.0'
  gem.add_development_dependency 'rake'
end
