module Mongoid
  module Matchers
    module Associations
      if Mongoid::Compatibility::Version.mongoid7_or_newer?
        HAS_ONE = Mongoid::Association::Referenced::HasOne
        HAS_MANY = Mongoid::Association::Referenced::HasMany
        HAS_AND_BELONGS_TO_MANY = Mongoid::Association::Referenced::HasAndBelongsToMany
        BELONGS_TO = Mongoid::Association::Referenced::BelongsTo
        EMBEDS_ONE = Mongoid::Association::Embedded::EmbedsOne
        EMBEDS_MANY = Mongoid::Association::Embedded::EmbedsMany
        EMBEDDED_IN = Mongoid::Association::Embedded::EmbeddedIn
      else
        HAS_ONE = Mongoid::Relations::Referenced::One
        HAS_MANY = Mongoid::Relations::Referenced::Many
        HAS_AND_BELONGS_TO_MANY = Mongoid::Relations::Referenced::ManyToMany
        BELONGS_TO = Mongoid::Relations::Referenced::In
        EMBEDS_ONE = Mongoid::Relations::Embedded::One
        EMBEDS_MANY = Mongoid::Relations::Embedded::Many
        EMBEDDED_IN = Mongoid::Relations::Embedded::In
      end

      class HaveRelationMatcher < Matcher
        def initialize name, type
          @association = {}
          @association[:name] = name.to_s
          @association[:type] = type
          @description = "#{type_description} #{@association[:name].inspect}"
        end

        def of_type klass
          @association[:class] = klass
          @description << " of type #{@association[:class].inspect}"
          self
        end

        def as_inverse_of inverse_of
          @association[:inverse_of] = inverse_of
          @description << " as the inverse of #{@association[:inverse_of].inspect}"
          self
        end

        def matches? subject
          @klass    = class_of subject
          @metadata = @klass.relations[@association[:name]]
          @result   = true

          check_association_name
          check_association_type
          check_association_class if @association[:class]
          check_association_inverse_of if @association[:inverse_of]

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
          is_failure = if Mongoid::Compatibility::Version.mongoid7_or_newer?
            !@metadata.nil? && @metadata.class != @association[:type]
          else
            !@metadata.nil? && @metadata.relation != @association[:type]
          end

          if is_failure
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

        def check_association_inverse_of
          if @association[:inverse_of] != @metadata.inverse_of
            @negative_message = "..."
            @result = false
          else
            @positive_message << " as inverse of #{@metadata.inverse_of}" if @association[:inverse_of]
          end
        end

        def type_description type = nil, passive = true
          type ||= @association[:type]
          case type.name
          when HAS_ONE.name
            (passive ? 'reference' : 'references') << ' one'
          when HAS_MANY.name
            (passive ? 'reference' : 'references') << ' many'
          when HAS_AND_BELONGS_TO_MANY.name
            (passive ? 'reference' : 'references') << ' and referenced in many'
          when BELONGS_TO.name
            (passive ? 'be referenced' : 'referenced') << ' in'
          when EMBEDS_ONE.name
            (passive ? 'embed' : 'embeds') << ' one'
          when EMBEDS_MANY.name
            (passive ? 'embed' : 'embeds') << ' many'
          when EMBEDDED_IN.name
            (passive ? 'be' : 'is') << ' embedded in'
          else
            raise "Unknown association type #{type}"
          end
        end
      end

      def have_one association_name
        HaveRelationMatcher.new association_name, HAS_ONE
      end

      def have_many association_name
        HaveRelationMatcher.new association_name, HAS_MANY
      end

      def have_and_belong_to_many association_name
        HaveRelationMatcher.new association_name, HAS_AND_BELONGS_TO_MANY
      end

      def belong_to association_name
        HaveRelationMatcher.new association_name, BELONGS_TO
      end

      def embed_one association_name
        HaveRelationMatcher.new association_name, EMBEDS_ONE
      end

      def embed_many association_name
        HaveRelationMatcher.new association_name, EMBEDS_MANY
      end

      def embedded_in association_name
        HaveRelationMatcher.new association_name, EMBEDDED_IN
      end
    end
  end
end
