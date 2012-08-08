require "mongoid-minitest"
require "minitest/autorun"

Dir[File.dirname(__FILE__) + "/models/*.rb"].each { |f| require f }

Mongoid.configure do |config|
	config.connect_to("mongoid-minitest-test")
end

class MiniTest::Spec
  include Mongoid::Matchers
end
