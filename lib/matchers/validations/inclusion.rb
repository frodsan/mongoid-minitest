module Mongoid
  module Matchers
    module Validations
      class ValidateInclusionMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :inclusion)
        end

        def to_allow(*values)
          @allowed_values = values.flatten
          self
        end

        def matches?(subject)
          return false unless result = super(subject)

          if @allowed_values
            not_allowed_values = @allowed_values - @validator.options[:in].to_a
            if not_allowed_values.empty?
              @positive_message << ' allowing all values mentioned'
            else
              @negative_message << ' not allowing the following the  values:'
              @negative_message << " #{not_allowed_values.inspect}"
              result = false
            end
          end

          result
        end

        def description
          if @allowed_values
            super << " allowing the values: #{to_sentence(@allowed_values)}"
          end
        end
      end

      def validate_inclusion_of(field)
        ValidateInclusionMatcher.new(field)
      end
    end
  end
end
