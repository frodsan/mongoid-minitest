require 'test_helper'

describe Mongoid::Matchers::Associations do

  describe "have_many" do
    subject { Person }

    it { must have_many(:pets) }
    it { wont have_many(:accounts) }

    it { must have_many(:pets).of_type(Pet) }
    it { wont have_many(:pets).of_type(Person) }
  end

end
