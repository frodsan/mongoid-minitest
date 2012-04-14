module Mongoid
  module Matchers
    module Associations
      HAS_ONE = Mongoid::Relations::Referenced::One
      HAS_MANY = Mongoid::Relations::Referenced::Many
      HAS_AND_BELONGS_TO_MANY = Mongoid::Relations::Referenced::ManyToMany
      BELONGS_TO = Mongoid::Relations::Referenced::In
      EMBEDS_ONE = Mongoid::Relations::Embedded::One

      class HaveAssociationMatcher
        include Helpers

        def initialize(name, type)
          @association = {}
          @association[:name] = name.to_s
          @association[:type] = type
          @description = "#{type_description} #{@association[:name].inspect}"
        end

        def of_type(klass)
          @association[:class] = klass
          @description << " of type #{@association[:class].inspect}"
          self
        end

        def matches?(subject)
          @klass    = class_of(subject)
          @metadata = @klass.relations[@association[:name]] 
          @result   = true

          check_association_name
          check_association_type
          check_association_class if @association[:class]

          @result
        end

        def failure_message
          "#{@klass} to #{@description}, got #{@negative_message}"
        end

        def negative_failure_message
          "#{@klass} to not #{@description}, got #{@positive_message}"
        end

        private

        def check_association_name
          if @metadata.nil?
            @negative_message = "no association named #{@association[:name].inspect}"
            @result = false
          else
            @positive_message = "association named #{@association[:name].inspect}"
          end
        end

        def check_association_type
          if !@metadata.nil? && @metadata.relation != @association[:type]
            @negative_message = association_type_failure_message
            @result = false
          else
            @positive_message = association_type_failure_message
          end
        end

        def association_type_failure_message
          msg = "#{@klass.inspect}"
          msg << " #{type_description(@association[:type], false)}"
          msg << " #{@association[:name].inspect}"

          msg
        end

        def check_association_class
          if @association[:class] != @metadata.klass
            @negative_message = "#{@positive_message} of type #{@metadata.klass}"
            @result = false
          else
            @positive_message << " of type #{@metadata.klass}" if @association[:class]
          end
        end

        def type_description(type = nil, passive = true)
          type ||= @association[:type]
          case type.name
          when HAS_ONE.name
            (passive ? "reference" : "references") << " one"
          when HAS_MANY.name
            (passive ? "reference" : "references") << " many"
          when HAS_AND_BELONGS_TO_MANY.name
            (passive ? "reference" : "references") << " and referenced in many"
          when BELONGS_TO.name
            (passive ? "be referenced" : "referenced") << " in"
          when EMBEDS_ONE.name
            (passive ? "embed" : "embeds") << " one"
          else
            raise "Unknown association type #{type}"
          end
        end
      end

      def have_one(association_name)
        HaveAssociationMatcher.new(association_name, HAS_ONE)
      end

      def have_many(association_name)
        HaveAssociationMatcher.new(association_name, HAS_MANY)
      end

      def have_and_belong_to_many(association_name)
        HaveAssociationMatcher.new(association_name, HAS_AND_BELONGS_TO_MANY)
      end

      def belong_to(association_name)
        HaveAssociationMatcher.new(association_name, BELONGS_TO)
      end

      def embed_one(association_name)
        HaveAssociationMatcher.new(association_name, EMBEDS_ONE)
      end
    end
  end
end
