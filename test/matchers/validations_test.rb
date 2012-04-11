require "test_helper"

describe Mongoid::Matchers::Validations do
  subject { Person }

  it { must validate_presence_of(:name) }
  it { wont validate_presence_of(:age) }

  it { must validate_uniqueness_of(:nick) }
  it { wont validate_uniqueness_of(:name) }
  it { must validate_uniqueness_of(:nick).case_insensitive }
  it { wont validate_uniqueness_of(:code).case_insensitive }

  it { must validate_length_of(:password) }
  it { wont validate_length_of(:code) }
end
