module Mongoid
  module Matchers
    module Validations
      class ValidateExclusionMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :exclusion)
        end

        def to_not_allow(*values)
          @not_allowed_values = [values].flatten
          self
        end

        def matches?(actual)
          return false unless result = super(actual)

          if @not_allowed_values
            allowed_values = @not_allowed_values - @validator.options[:in]
            if allowed_values.empty?
              @positive_message << " not allowing all values mentioned"
            else
              @negative_message << " allowing the values: #{allowed_values.collect(&:inspect).to_sentence}"
              result = false
            end
          end

          result
        end

        def description
          desc = []
          desc << " not allowing the values: #{@not_allowed_values.collect(&:inspect).to_sentence}" if @not_allowed_values
          super << desc.to_sentence
        end
      end

      def validate_exclusion_of(field)
        ValidateExclusionMatcher.new(field)
      end
    end
  end
end
