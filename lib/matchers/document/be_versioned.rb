module Mongoid
  module Matchers
    module Document
      class BeVersionedMatcher < DocumentModulesMatcher
        def matches?(subject)
          super(subject, VERSIONING)
        end
      end

      def be_versioned
        BeVersionedMatcher.new
      end
    end
  end
end
