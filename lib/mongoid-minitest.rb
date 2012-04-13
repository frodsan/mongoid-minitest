gem "minitest"
require "mongoid"
require "minitest/spec"

require "minitest/matchers"
require "matchers/helpers"
require "matchers/document/document"
require "matchers/document/have_field"
require "matchers/document/be_stored_in"
require "matchers/validations/validations"
require "matchers/validations/presence"
require "matchers/validations/uniqueness"
require "matchers/validations/length"
require "matchers/validations/format"
require "matchers/validations/inclusion"
require "matchers/validations/exclusion"
require "matchers/validations/confirmation"
require "matchers/validations/acceptance"
require "matchers/associations/associations"

module Mongoid
  module Matchers
    include Mongoid::Matchers::Document
    include Mongoid::Matchers::Validations
    include Mongoid::Matchers::Associations
  end
end
