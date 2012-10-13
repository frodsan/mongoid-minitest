module Mongoid
  module Matchers
    class HaveIndexMatcher < Matcher
      def initialize(field)
        @field = field.to_s
      end

      def matches?(subject)
        @klass = class_of(subject)

        @klass.index_options.each do |key, options|
          unless key[@field.to_sym] || key[:"#{@field}_id"]
            @error = "no index for #{@field.inspect}"

            return false
          end
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
