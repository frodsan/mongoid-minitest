module Mongoid
  module Matchers
    module Document
      class BeTimestamped < DocumentModulesMatcher
        def matches?(subject)
          super(subject, TIMESTAMPS)
        end
      end

      def be_timestamped
        BeTimestamped.new
      end
    end
  end
end
