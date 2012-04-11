module Mongoid
  module Matchers
    module Document
      class BeParanoidMatcher
        def matches?(klass)
          @klass = klass
          @klass.included_modules.include?(Mongoid::Paranoia)
        end

        def description
          "be a paranoid Mongoid document"
        end
      end

      def be_paranoid
        BeParanoidMatcher.new
      end
    end
  end
end
