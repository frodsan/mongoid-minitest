module Mongoid
  module Matchers
    module Document
      DOCUMENT   = Mongoid::Document
      PARANOIA   = Mongoid::Paranoia   unless Mongoid::VERSION.to_i >= 4
      VERSIONING = Mongoid::Versioning unless Mongoid::VERSION.to_i >= 4
      TIMESTAMPS = Mongoid::Timestamps

      # TODO: add documentation.
      def be_document
        DocumentMatcher.new DOCUMENT
      end

      unless Mongoid::VERSION.to_i >= 4
        # TODO: add documentation.
        def be_paranoid
          DocumentMatcher.new PARANOIA
        end

        # TODO: add documentation.
        def be_versioned
          DocumentMatcher.new VERSIONING
        end
      end

      # TODO: add documentation.
      def be_timestamped
        DocumentMatcher.new TIMESTAMPS
      end

      private

      class DocumentMatcher < Matcher
        attr_reader :mod

        def initialize mod
          @mod = mod
        end

        def matches? subject
          class_of(subject).included_modules.include? mod
        end

        def failure_message
          "Expected #{inspect} to #{description}"
        end

        def negative_failure_message
          "Expected not to #{description}"
        end

        def description
          msg = case
                when mod == DOCUMENT   then ''
                when mod == PARANOIA   then 'paranoid '
                when mod == VERSIONING then 'versioned '
                when mod == TIMESTAMPS then 'timestamped '
                else raise "Unknow Mongoid module #{mod}"
                end

          "be a #{msg}Mongoid document"
        end
      end
    end
  end
end
