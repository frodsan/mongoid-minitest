module Mongoid
  module Matchers
    module Document
      class BeDocumentMatcher < DocumentModulesMatcher
        def matches?(subject)
          super(subject, DOCUMENT)
        end
      end

      def be_document
        BeDocumentMatcher.new
      end
    end
  end
end
