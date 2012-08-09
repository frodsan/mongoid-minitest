module Mongoid
  module Matchers
    module Validations
      class ValidateExclusionMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :exclusion)
        end

        def to_not_allow(*values)
          @not_allowed_values = values.flatten
          self
        end

        def matches?(subject)
          return false unless result = super(subject)

          if @not_allowed_values
            allowed_values = @not_allowed_values - @validator.options[:in].to_a
            if allowed_values.empty?
              @positive_message << ' not allowing all values mentioned'
            else
              @negative_message << ' allowing the values:'
              @negative_message << " #{to_sentence(allowed_values)}"
              result = false
            end
          end

          result
        end

        def description
          if @not_allowed_values
            super << " not allowing the values: #{to_sentence(@not_allowed_values)}"
          end
        end
      end

      def validate_exclusion_of(field)
        ValidateExclusionMatcher.new(field)
      end
    end
  end
end
