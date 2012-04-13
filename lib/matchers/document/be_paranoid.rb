module Mongoid
  module Matchers
    module Document
      class BeParanoidMatcher < DocumentModulesMatcher
        def matches?(subject)
          super(subject, PARANOIA)
        end
      end

      def be_paranoid
        BeParanoidMatcher.new
      end
    end
  end
end
