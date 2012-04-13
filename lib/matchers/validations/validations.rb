module Mongoid
  module Matchers
    module Validations
      class HaveValidationMatcher
        include Mongoid::Matchers::Helpers

        def initialize(field, validation_type)
          @field = field.to_s
          @type = validation_type.to_s
        end

        def matches?(subject)
          @klass = class_of(subject)
          @validator = detect_validator

          if @validator
            @negative_message = "#{@type.inspect} validator on #{@field.inspect}"
            @positive_message = "#{@type.inspect} validator on #{@field.inspect}"
          else
            @negative_message = "no #{@type.inspect} validator on #{@field.inspect}"
            return false
          end

          true
        end

        def failure_message
          "#{@klass} to #{description}; instead got #{@negative_message}"
        end

        def negative_failure_message
          "#{@klass} to not #{description}; instead got #{@positive_message}"
        end

        def description
          "validate #{@type.inspect} of #{@field.inspect}"
        end

        private

        def detect_validator
          @klass.validators_on(@field).detect { |v| v.kind.to_s == @type }
        end
      end
    end
  end
end
