module Mongoid
  module Matchers
    module Validations
      class ValidateAssociated < HaveValidationMatcher
        def initialize(association_name)
          super(association_name, :associated)
        end

        def description
          "validate associated #{@field.inspect}"
        end
      end

      def validate_associated(association_name)
        ValidateAssociated.new(association_name)
      end
    end
  end
end
