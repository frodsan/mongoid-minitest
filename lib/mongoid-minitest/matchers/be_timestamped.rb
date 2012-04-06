module Mongoid
  module MiniTest
    module Matchers
      class BeTimestamped
        def matches?(klass)
          @klass = klass
          @klass.included_modules.include?(Mongoid::Timestamps)
        end

        def description
          "be timestamped Mongoid document"
        end
      end

      def be_timestamped
        BeTimestamped.new
      end
    end
  end
end
