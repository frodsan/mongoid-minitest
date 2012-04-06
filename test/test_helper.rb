require "mongoid-minitest"
require "minitest/autorun"

Dir[File.dirname(__FILE__) + "/models/*.rb"].each { |f| require f }

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid-minitest-test")
end

class MiniTest::Spec
  include Mongoid::MiniTest::Matchers
end
