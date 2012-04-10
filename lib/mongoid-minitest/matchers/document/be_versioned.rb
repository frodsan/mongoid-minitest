module Mongoid
  module MiniTest
    module Matchers
      class BeVersionedMatcher
        def matches?(klass)
          @klass = klass
          @klass.included_modules.include?(Mongoid::Versioning)
        end

        def description
          "be a versioned Mongoid document"
        end
      end

      def be_versioned
        BeVersionedMatcher.new
      end
    end
  end
end
