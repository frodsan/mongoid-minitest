module Mongoid
  module MiniTest
    module Matchers
      class HaveFieldMatcher
        def initialize(field)
          @field = field.to_s
        end

        def of_type(type)
          @type = type
          self
        end

        def matches?(klass)
          @klass  = klass.is_a?(Class) ? klass : klass.class
          @errors = []

          if @klass.fields.include?(@field)
            error = ""
            
            if @type && @klass.fields[@field].type != @type
              error << " of type #{@klass.fields[@field].type}"
            end

            @errors << "field #{@field.inspect << error}" if !error.blank?
          else
            @errors << "no field named #{@field}"
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
          desc = "have field named #{@field.inspect}"
          desc << " of type #{@type.inspect}" if @type
          desc
        end
      end

      def have_field(field)
        HaveFieldMatcher.new(field)
      end
    end
  end
end
