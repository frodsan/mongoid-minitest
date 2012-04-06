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

        def with_default_value(default)
          @default = default
          self
        end

        def matches?(klass)
          @klass  = klass.is_a?(Class) ? klass : klass.class
          @errors = []

          if @klass.fields.include?(@field)
            error = ""
            field = @klass.fields[@field]
            
            if @type && field.type != @type
              error << " of type #{field.type}"
            end

            if !@default.nil? && !field.default.nil? && field.default != @default
              error << " with default value of #{field.default}"
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
          desc << " with default value of #{@default.inspect}" if !@default.nil?
          desc
        end
      end

      def have_field(field)
        HaveFieldMatcher.new(field)
      end
    end
  end
end
