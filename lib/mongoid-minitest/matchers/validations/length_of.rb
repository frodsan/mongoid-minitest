module Mongoid
  module Matchers
    module Validations
      class ValidateLengthMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :length)
        end
      end

      def validate_length_of(field)
        ValidateLengthMatcher.new(field)
      end
    end
  end
end
