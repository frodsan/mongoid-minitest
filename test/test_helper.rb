require 'bundler/setup'
gem 'minitest'
require 'minitest/autorun'
require 'mongoid'
require 'mongoid-minitest'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |f| require f }

Mongoid.configure do |config|
  config.connect_to('mongoid-minitest-test')
end

class MiniTest::Spec
  include Mongoid::Matchers
end
