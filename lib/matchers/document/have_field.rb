module Mongoid
  module Matchers
    module Document
      # TODO: Add documentation.
      def have_field *fields
        HaveFieldMatcher.new(*fields)
      end
      alias :have_fields :have_field

      private

      class HaveFieldMatcher < Matcher
        attr_reader :fields, :klass, :type, :default, :errors

        def initialize *fields
          @fields = fields.collect(&:to_s)
          @errors = []
        end

        def of_type type
          @type = type
          self
        end

        def with_default_value default
          @default = default
          self
        end

        def matches? subject
          @klass = class_of subject

          fields.each do |field|
            if klass.fields.include? field
              error = ''
              result_field = klass.fields[field]

              if check_type_with result_field.type
                error << " of type #{result_field.type.inspect}"
              end

              if check_default_with result_field.default_val
                error << " with default value of #{result_field.default_val.inspect}"
              end

              errors << "field #{field.inspect << error}" if !error.blank?
            else
              errors << "no field named #{field.inspect}"
            end
          end

          errors.empty?
        end

        def failure_message
          "#{klass} to #{description}, got #{errors.to_sentence}"
        end

        def negative_failure_message
          msg = "#{klass.inspect} to not #{description}, "
          msg << "got #{klass.inspect} to #{description}"
        end

        def description
          desc = "have #{fields.size > 1 ? 'fields' : 'field'} named"
          desc << " #{to_sentence(fields)}"
          desc << " of type #{type.inspect}" if type
          desc << " with default value of #{default.inspect}" if !default.nil?
          desc
        end

        private

        def check_type_with _type
          type && _type != type
        end

        def check_default_with _default
          !default.nil? && !_default.nil? && _default != default
        end
      end
    end
  end
end
