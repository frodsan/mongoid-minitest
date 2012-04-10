module Mongoid
  module MiniTest
    module Matchers
      class BeDocumentMatcher
        def matches?(klass)
          @klass = klass
          @klass.included_modules.include?(Mongoid::Document)
        end

        def description
          "be a Mongoid document"
        end
      end

      def be_document
        BeDocumentMatcher.new
      end
    end
  end
end
