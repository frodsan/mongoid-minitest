$LOAD_PATH.unshift(File.dirname(__FILE__))
MATCHERS = "/mongoid-minitest/matchers/*.rb"

gem "minitest"
require "mongoid"
require "minitest/spec"

require "minitest/matchers"
Dir[File.dirname(__FILE__) + MATCHERS].each { |f| require f }
