module Mongoid
  module Matchers
    module Helpers
      def to_sentence ary
        ary.collect(&:inspect).to_sentence
      end

      def class_of subject
        subject.is_a?(Class) ? subject : subject.class
      end
    end
  end
end
