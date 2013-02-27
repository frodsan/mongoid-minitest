gem 'minitest'
require 'minitest-activemodel'
require 'matchers/matcher'
require 'matchers/document/document'
require 'matchers/document/have_field'
require 'matchers/document/be_stored_in'
require 'matchers/document/have_index'
require 'matchers/validations/validations'
require 'matchers/validations/inclusion'
require 'matchers/validations/exclusion'
require 'matchers/validations/associated'
require 'matchers/associations/associations'

module Mongoid
  module Matchers
    include Document
    include Validations
    include Associations
    include MiniTest::Matchers::ActiveModel
  end
end
