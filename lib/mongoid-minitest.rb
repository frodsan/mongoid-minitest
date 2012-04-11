$LOAD_PATH.unshift(File.dirname(__FILE__) + "/mongoid-minitest/matchers")

gem "minitest"
require "mongoid"
require "minitest/spec"

require "minitest/matchers"
require "document/have_field"
require "document/be_document"
require "document/be_paranoid"
require "document/be_versioned"
require "document/be_timestamped"
require "validations/validations"
require "validations/presence_of"
require "validations/uniqueness_of"
require "validations/length_of"
require "validations/format_of"

module Mongoid
  module Matchers
    include Mongoid::Matchers::Document
    include Mongoid::Matchers::Validations
  end
end
