require "test_helper"

describe Mongoid::Matchers::Validations do
  subject { Person }

  it { must validate_presence_of(:name) }
  it { wont validate_presence_of(:age) }
end
