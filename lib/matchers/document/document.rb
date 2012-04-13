module Mongoid
  module Matchers
    module Document
      DOCUMENT   = Mongoid::Document
      PARANOIA   = Mongoid::Paranoia
      VERSIONING = Mongoid::Versioning
      TIMESTAMPS = Mongoid::Timestamps

      class DocumentModuleMatcher
        include Helpers
        def initialize(mod)
          @mod = mod
        end
        
        def matches?(subject)
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

      def be_document
        DocumentModuleMatcher.new(DOCUMENT)
      end

      def be_paranoid
        DocumentModuleMatcher.new(PARANOIA)
      end

      def be_versioned
        DocumentModuleMatcher.new(VERSIONING)
      end

      def be_timestamped
        DocumentModuleMatcher.new(TIMESTAMPS)
      end
    end
  end
end
