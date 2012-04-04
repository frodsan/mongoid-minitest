$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'mongoid'

require 'matchers/have_field'

module Mongoid
  module MiniTest
    module Matchers
    end
  end
end
