module Mongoid
  module Matchers
    class HaveIndexMatcher
      include Helpers

      def initialize(field)
        @field = field.to_s
      end

      def matches?(subject)
        @klass = class_of(subject)

        if !@klass.index_options[@field.to_sym]
          @error = "no index for #{@field.inspect}"

          return false
        end

        true
      end

      def failure_message
        "#{@klass} to #{description}, got #{@error}"
      end

      def negative_failure_message
        "#{@klass} to not #{description}, got #{@klass} to #{description}"
      end

      def description
        "have an index for #{@field.inspect}"
      end
    end

    def have_index_for(field)
      HaveIndexMatcher.new(field)
    end
  end
end
