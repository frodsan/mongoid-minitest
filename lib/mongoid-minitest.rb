gem 'minitest'
require 'minitest/matchers'
require 'matchers/matcher'
require 'matchers/document/document'
require 'matchers/document/have_field'
require 'matchers/document/be_stored_in'
require 'matchers/document/have_index'
require 'matchers/validations/validations'
require 'matchers/validations/presence'
require 'matchers/validations/uniqueness'
require 'matchers/validations/length'
require 'matchers/validations/format'
require 'matchers/validations/inclusion'
require 'matchers/validations/exclusion'
require 'matchers/validations/confirmation'
require 'matchers/validations/acceptance'
require 'matchers/validations/associated'
require 'matchers/associations/associations'

module Mongoid
  module Matchers
    include Document
    include Validations
    include Associations
  end
end
