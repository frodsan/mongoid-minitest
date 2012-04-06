gem "minitest"
require "mongoid"
require "minitest/spec"
require "minitest/autorun"

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid-minitest-test")
end

Dir[File.dirname(__FILE__) + "/dummy/*.rb"].each { |f| require f }

require "mongoid-minitest"

class MiniTest::Spec
  include Mongoid::MiniTest::Matchers
end
