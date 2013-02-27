module Mongoid
  module Matchers
    module Document
      DOCUMENT   = Mongoid::Document
      PARANOIA   = Mongoid::Paranoia   unless Mongoid::VERSION == '4.0.0'
      VERSIONING = Mongoid::Versioning unless Mongoid::VERSION == '4.0.0'
      TIMESTAMPS = Mongoid::Timestamps

      class DocumentMatcher < Matcher
        def initialize mod
          @mod = mod
        end

        def matches? subject
          class_of(subject).included_modules.include? @mod
        end

        def description
          msg = case
                when @mod == DOCUMENT   then ''
                when @mod == PARANOIA   then 'paranoid '
                when @mod == VERSIONING then 'versioned '
                when @mod == TIMESTAMPS then 'timestamped '
                else raise "Unknow Mongoid module #{@mod}"
                end

          "be a #{msg}Mongoid document"
        end
      end

      def be_document
        DocumentMatcher.new DOCUMENT
      end

      unless Mongoid::VERSION == '4.0.0'
        def be_paranoid
          DocumentMatcher.new PARANOIA
        end

        def be_versioned
          DocumentMatcher.new VERSIONING
        end
      end

      def be_timestamped
        DocumentMatcher.new TIMESTAMPS
      end
    end
  end
end
