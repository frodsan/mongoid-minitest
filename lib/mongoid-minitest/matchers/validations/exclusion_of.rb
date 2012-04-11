module Mongoid
  module Matchers
    module Validations
      def validate_exclusion_of(field)
        HaveValidationMatcher.new(field, :exclusion)
      end
    end
  end
end
