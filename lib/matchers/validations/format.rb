module Mongoid
  module Matchers
    module Validations
      class ValidateFormatMatcher < HaveValidationMatcher
        def initialize field
          super field, :format
          @valid = @invalid = nil
        end

        def to_allow valid_value
          @valid = valid_value
          self
        end

        def to_not_allow invalid_value
          @invalid = invalid_value
          self
        end

        def matches? subject
          return false unless @result = super(subject)

          check_valid_value   if @valid
          check_invalid_value if @invalid

          @result
        end

        def description
          desc = []
          desc << " allowing the value #{@valid.inspect}" if @valid
          desc << " not allowing the value #{@invalid.inspect}" if @invalid
          super << desc.to_sentence
        end

        private

        def check_valid_value
          if format == @valid || format =~ @valid
            @positive_message << " with #{@valid.inspect} as a valid value"
          else
            @negative_message << " with #{@valid.inspect} as an invalid value"
            @result = false
          end
        end

        def check_invalid_value
          if format !~ @invalid
            @positive_message << " with #{@invalid.inspect} as a invalid value"
          else
            @negative_message << " with #{@invalid.inspect} as a valid value"
            @result = false
          end
        end

        def format
          @validator.options[:with]
        end
      end

      def validate_format_of field
        ValidateFormatMatcher.new field
      end
    end
  end
end
