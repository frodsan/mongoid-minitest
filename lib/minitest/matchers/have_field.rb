module Mongoid
  module MiniTest
    module Matchers
      class HaveFieldMatcher
        def initialize(field)
          @field = field.to_s
        end

        def matches?(klass)
          @klass  = klass.is_a?(Class) ? klass : klass.class
          @errors = []

          if @klass.fields.include?(@field)
          else
            @errors.push "no field named #{@field}"
          end

          @errors.empty?
        end

        def failure_message
          "Expected #{@klass.inspect} to #{description}, got #{@errors.to_sentence}"
        end

        def negative_failure_message
          msg =  "Expected #{@klass.inspect} to not #{description}, "
          msg << "got #{@klass.inspect} to #{description}"
        end

        def description
          desc = "have field named #{@field}"
          desc
        end
      end

      def have_field(field)
        HaveFieldMatcher.new(field)
      end
    end
  end
end
