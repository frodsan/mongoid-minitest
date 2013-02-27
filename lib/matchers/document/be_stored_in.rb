module Mongoid
  module Matchers
    def be_stored_in collection_name
      BeStoredInMatcher.new collection_name
    end

    private

    class BeStoredInMatcher < Matcher
      attr_reader :collection_name

      def initialize collection_name
        @collection_name = collection_name.to_s
      end

      def matches? subject
        class_of(subject).collection_name.to_s == collection_name
      end

      def description
        "be stored in #{collection_name.inspect}"
      end
    end
  end
end
