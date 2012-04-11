require "test_helper"

describe Mongoid::Matchers::Validations do
  subject { Person }

  it { must validate_presence_of(:name) }
  it { wont validate_presence_of(:age) }

  it { must validate_uniqueness_of(:login) }
  it { wont validate_uniqueness_of(:name) }
  it { must validate_uniqueness_of(:login).case_insensitive }
  it { wont validate_uniqueness_of(:code).case_insensitive }

  it { must validate_length_of(:password) }
  it { wont validate_length_of(:code) }
  it { must validate_length_of(:password).with_min(8) }
  it { wont validate_length_of(:password).with_min(0) }
  it { must validate_length_of(:password).with_minimum(8) }
  it { wont validate_length_of(:password).with_minimum(0) }
  it { must validate_length_of(:password).with_max(16) }
  it { wont validate_length_of(:password).with_max(8) }
  it { must validate_length_of(:password).with_maximum(16) }
  it { wont validate_length_of(:password).with_maximum(8) }
end
