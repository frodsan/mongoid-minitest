module Mongoid
  module MiniTest
    module Matchers
      
      def have_field(klass, field_name)
        klass.fields[field_name.to_s]
      end
        
    end
  end
end
