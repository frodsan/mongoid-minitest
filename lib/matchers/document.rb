module Mongoid
  module MiniTest
    module Matchers
      class HaveFieldMatcher
        def initialize(field)
          @field = field.to_s
        end

        def matches?(klass)
          klass.fields.include?(@field)
        end
      end

      def have_field(field)
        HaveFieldMatcher.new(field)
      end
    end
  end
end
