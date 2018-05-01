# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = 'mongoid-minitest'
  gem.version       = '1.1.0'

  gem.authors       = ['Francesco Rodriguez', 'Sascha Wessel', 'Godfrey Chan', 'Ryan McGeary']
  gem.email         = ['frodsan@protonmail.ch', 'godfreykfc@gmail.com', 'ryan@mcgeary.org']
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

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency 'minitest', '~> 5.0'
  gem.add_dependency 'mongoid' , '>= 3', '<= 7.0'
  gem.add_dependency 'minitest-activemodel', '~> 1.1'
  gem.add_dependency 'mongoid-compatibility'

  gem.add_development_dependency 'minitest-matchers'
  gem.add_development_dependency 'rake'
end
