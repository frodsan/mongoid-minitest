require 'test_helper'

describe "Associations" do

  describe Person do
    subject { Person }

    it { must have_many(:pets).of_type(Pet) }
    it { must have_one(:account).of_type(Account) }
  end

  describe Pet do
    subject { Pet }

    it { must belong_to(:person).of_type(Person) }
  end

  describe Account do
    subject { Account }

    it { must belong_to(:person).of_type(Person) }
  end

end
