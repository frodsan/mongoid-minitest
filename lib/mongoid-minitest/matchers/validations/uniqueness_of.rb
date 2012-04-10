module Mongoid
  module Matchers
    module Validations
      class ValidateUniquenessMatcher < HaveValidationMatcher
        def initialize(field)
          super(field, :uniqueness)
        end

        def case_insensitive
          @case_insensitive = true
          self
        end

        def matches?(klass)
          return false unless @result = super(klass)

          check_case_sensivity if @case_insensitive

          @result
        end

        def check_case_sensivity
          if @validator.options[:case_sensitive] == false
            @positive_result_message << " with case insensitive values"
          else
            @negative_result_message << " without case insensitive values"
            @result = false
          end
        end

        def description
          desc =  []
          desc << " allowing case insensitive values" if @case_insensitive
          super << desc.to_sentence
        end
      end

      def validate_uniqueness_of(field)
        ValidateUniquenessMatcher.new(field)
      end
    end
  end
end
