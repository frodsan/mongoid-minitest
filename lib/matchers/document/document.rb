module Mongoid
  module Matchers
    module Document
      DOCUMENT   = Mongoid::Document
      PARANOIA   = Mongoid::Paranoia
      VERSIONING = Mongoid::Versioning
      TIMESTAMPS = Mongoid::Timestamps

      class DocumentModulesMatcher
        include Helpers
        
        def matches?(subject, mod)
          @mod = mod
          class_of(subject).included_modules.include?(@mod)
        end

        def description
          msg = case
                when @mod == DOCUMENT   then ""
                when @mod == PARANOIA   then "paranoid "
                when @mod == VERSIONING then "versioned "
                when @mod == TIMESTAMPS then "timestamped "
                else raise "Unknow Mongoid module #{@mod}"
                end

          "be a #{msg}Mongoid document"
        end
      end
    end
  end
end
