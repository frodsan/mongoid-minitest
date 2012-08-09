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

        def scoped_to(*scope)
          @scope = [scope].flatten.map(&:to_s)
          self
        end

        def matches?(subject)
          return false unless @result = super(subject)

          check_scope if @scope
          check_case_sensivity if @case_insensitive

          @result
        end

        def description
          desc = []
          desc << " scoped to #{to_sentence(@scope)}" if @scope
          desc << ' allowing case insensitive values' if @case_insensitive
          super << desc.to_sentence
        end

        private

        def check_scope
          actual_scope = [@validator.options[:scope]].flatten.map(&:to_s)
          message = " scoped to #{to_sentence(actual_scope)}"

          if actual_scope == @scope
            @positive_message << message
          else
            @negative_message << message
            @result = false
          end
        end

        def check_case_sensivity
          if @validator.options[:case_sensitive] == false
            @positive_message << ' with case insensitive values'
          else
            @negative_message << ' without case insensitive values'
            @result = false
          end
        end
      end

      def validate_uniqueness_of(field)
        ValidateUniquenessMatcher.new(field)
      end
    end
  end
end
