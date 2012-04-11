module Mongoid
  module Matchers
    module Validations
      class ValidateLengthMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :length)
        end

        def with_minimum(value)
          @minimum = value
          self
        end
        alias :with_min :with_minimum

        def with_maximum(value)
          @maximum = value
          self
        end
        alias :with_max :with_maximum

        def matches?(klass)
          return false unless @result = super(klass)

          check_minimum if @minimum
          check_maximum if @maximum

          @result
        end

        def description
          desc = []
          desc << " with minimum #{@minimum}" if @minimum
          desc << " with maximum #{@maximum}" if @maximum
          super << desc.to_sentence
        end

        private

        def check_minimum
          actual = @validator.options[:minimum]
          if actual == @minimum
            @positive_message << " with minimum of #{@minimum}"
          else
            @negative_message << " with minimum of #{actual}"
            @result = false
          end
        end

        def check_maximum
          actual = @validator.options[:maximum]
          if actual == @maximum
            @positive_message << " with maximum of #{@maximum}"
          else
            @negative_message << " with maximum of #{actual}"
            @result = false
          end
        end
      end

      def validate_length_of(field)
        ValidateLengthMatcher.new(field)
      end
    end
  end
end
