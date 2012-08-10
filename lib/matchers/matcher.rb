require_relative 'helpers'

module Mongoid
  module Matchers
    class Matcher
      include Helpers

      def failure_message
        "Expected #{inspect} to #{description}".squeeze ' '
      end

      def negative_failure_message
        "Expected not to #{description}".squeeze ' '
      end
    end
  end
end
