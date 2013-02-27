module Mongoid
  module Matchers
    class Matcher
      include MiniTest::Matchers::ActiveModel::Helpers

      def failure_message
        "Expected #{inspect} to #{description}".squeeze ' '
      end

      def negative_failure_message
        "Expected not to #{description}".squeeze ' '
      end
    end
  end
end
