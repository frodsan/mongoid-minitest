module Mongoid
  module Matchers
    module Helpers
      def to_sentence(ary)
        ary.collect(&:inspect).to_sentence
      end
    end
  end
end
