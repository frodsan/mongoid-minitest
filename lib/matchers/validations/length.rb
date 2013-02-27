module Mongoid
  module Matchers
    module Validations
      class ValidateLengthMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :length)
          @minimum =  @maximum = @within = nil
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

        def within(value)
          @within = value
          self
        end
        alias :in :within

        def matches?(subject)
          return false unless @result = super(subject)

          check_minimum if @minimum
          check_maximum if @maximum
          check_range   if @within

          @result
        end

        def description
          desc = []
          desc << " with minimum #{@minimum}" if @minimum
          desc << " with maximum #{@maximum}" if @maximum
          desc << " within range #{@within}"  if @within
          super << desc.to_sentence
        end

        private

        def check_minimum
          actual = @validator.options[:minimum]
          if actual == @minimum
            @positive_message << " with minimum of #{actual}"
          else
            @negative_message << " with minimum of #{actual}"
            @result = false
          end
        end

        def check_maximum
          actual = @validator.options[:maximum]
          if actual == @maximum
            @positive_message << " with maximum of #{actual}"
          else
            @negative_message << " with maximum of #{actual}"
            @result = false
          end
        end

        def check_range
          min, max = [@within.min, @within.max]
          actual_min = @validator.options[:minimum]
          actual_max = @validator.options[:maximum]

          if actual_min == min && actual_max == max
            @positive_message << " with range #{@within}"
          else
            @negative_message << " with range #{actual_min..actual_max}"
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
