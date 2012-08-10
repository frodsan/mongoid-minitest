module Mongoid
  module Matchers
    class BeStoredInMatcher < Matcher
      def initialize(collection_name)
        @collection_name = collection_name.to_s
      end

      def matches?(subject)
        class_of(subject).collection_name.to_s == @collection_name
      end

      def description
        "be stored in #{@collection_name.inspect}"
      end
    end

    def be_stored_in(collection_name)
      BeStoredInMatcher.new(collection_name)
    end
  end
end
