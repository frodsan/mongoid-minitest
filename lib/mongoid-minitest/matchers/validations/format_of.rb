module Mongoid
  module Matchers
    module Validations
      def validate_format_of(field)
        HaveValidationMatcher.new(field, :format)
      end
    end
  end
end
