$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
MODELS = File.join(File.dirname(__FILE__), "models")
$LOAD_PATH.unshift(MODELS)

require "mongoid"
require "minitest/autorun"
require "minitest/spec"

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid-minitest-test")
end

Dir[File.join(MODELS, "*.rb")].sort.each { |file| require File.basename(file) }

require "mongoid-minitest"

class MiniTest::Spec
  include Mongoid::MiniTest::Matchers
end
