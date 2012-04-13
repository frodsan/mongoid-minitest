require 'test_helper'

describe "Associations" do

  describe Person do
    subject { Person }

    it { must have_many(:pets).of_type(Pet) }
  end

  describe Pet do
    subject { Pet }

    it { must belong_to(:person).of_type(Person) }
  end

end
