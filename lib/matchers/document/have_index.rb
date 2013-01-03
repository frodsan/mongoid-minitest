module Mongoid
  module Matchers
    class HaveIndexMatcher < Matcher
      def initialize(*fields)
        @fields = fields.map(&:to_sym)
      end

      def matches?(subject)
        @klass = class_of(subject)
        @klass.index_options.any? do |index, options|
          index.keys == @fields
        end
      end

      def failure_message
        "#{@klass} to #{description}, got no index for #{@fields.inspect}"
      end

      def negative_failure_message
        "#{@klass} to not #{description}, got #{@klass} to #{description}"
      end

      def description
        "have an index for #{@fields.inspect}"
      end
    end

    def have_index_for(*fields)
      HaveIndexMatcher.new(*fields)
    end
  end
end
