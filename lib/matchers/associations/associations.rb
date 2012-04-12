module Mongoid
  module Matchers
    module Associations
      HAS_MANY = Mongoid::Relations::Referenced::Many

      class HaveAssociationMatcher
        def initialize(name, type)
          @association = {}
          @association[:name] = name.to_s
          @association[:type] = type
          @expectation_message = "#{type_description} #{@association[:name].inspect}"
        end

        def of_type(klass)
          @association[:class] = klass
          @expectation_message << " of type #{@association[:class].inspect}"
          self
        end

        def matches?(klass)
          @klass    = klass.is_a?(Class) ? klass : klass.class
          @metadata = @klass.relations[@association[:name]] 
          @result   = true

          check_association_name
          check_association_type  if @result
          check_association_class if @result

          @result
        end

        def failure_message
          "Expected #{@klass} to #{@expectation_message}, got #{@negative_message}"
        end

        def negative_failure_message
          "Expected #{@klass} to not #{@expectation_message}, got #{@positive_message}"
        end

        def description
          @expectation_message
        end

        private

        def check_association_name
          if @metadata.nil?
            @negative_message = "no association named #{@association[:name]}"
            @result = false
          else
            @positive_message = "association named #{@association[:name]}"
          end
        end

        def check_association_type
          @relation = @metadata.relation
          if @relation != @association[:type]
            @negative_message = association_type_failure_message
            @result = false
          else
            @positive_message = association_type_failure_message
          end
        end

        def association_type_failure_message
          msg = "#{@klass.inspect}"
          msg << " #{type_description(@relation, false)}"
          msg << " #{@association[:name].inspect}"

          msg
        end

        def check_association_class
          if !@association[:class].nil? and @association[:class] != @metadata.klass
            @negative_message = "#{@positive_message} of type #{@metadata.klass}"
            @result = false
          else
            @positive_message << " of type #{@metadata.klass}" if @association[:class]
          end
        end

        def type_description(type = nil, passive = true)
          type ||= @association[:type]
          case type.name
          when HAS_MANY.name
            (passive ? "reference" : "references") << " many"
          else
            raise "Unknown association type '%s'" % type
          end
        end
      end

      def have_many(association_name)
        HaveAssociationMatcher.new(association_name, HAS_MANY)
      end
    end
  end
end
