$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
DUMMY = File.join(File.dirname(__FILE__), "dummy")
$LOAD_PATH.unshift(DUMMY)

gem "minitest"
require "mongoid"
require "minitest/spec"
require "minitest/autorun"

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid-minitest-test")
end

Dir[File.join(DUMMY, "*.rb")].sort.each { |file| require File.basename(file) }

require "mongoid-minitest"

class MiniTest::Spec
  include Mongoid::MiniTest::Matchers

  def assert_failure(expected, klass = MiniTest::Assertion)
    e = assert_raises(klass) { yield }

    if expected
      msg = e.message.sub(/(---Backtrace---).*/m, '\1')
      msg.gsub!(/\(oid=[-0-9]+\)/, '(oid=N)')

      assert_equal expected, msg
    end

    true
  end
end
