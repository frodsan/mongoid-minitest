module Mongoid
  module Matchers
    class HaveIndexMatcher < Matcher
      def initialize(field)
        @field = field.to_s
      end

      def matches?(subject)
        @klass = class_of(subject)

        @klass.index_options.any? do |index, options|
          index[@field.to_sym]
        end
      end

      def failure_message
        "#{@klass} to #{description}, got no index for #{@field.inspect}"
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
