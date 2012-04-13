module Mongoid
  module Matchers
    module Validations
      class ValidateAcceptanceMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :acceptance)
        end

        def accept_with(value)
          @accepted = value
          self
        end

        def matches?(subject)
          return false unless @result = super(subject)
          
          check_accepted_value if @accepted

          @result
        end

        def description
          desc = []
          desc << " accept with #{@accepted.inspect}" if @accepted
          super << desc.to_sentence
        end

        private

        def check_accepted_value
          actual = @validator.options[:accept]

          if actual == @accepted
            @positive_message << " accept with #{actual.inspect}"
          else
            @negative_message << " accept with #{actual.inspect}"
            @result = false
          end
        end
      end

      def validate_acceptance_of(field)
        ValidateAcceptanceMatcher.new(field)
      end
    end
  end
end
