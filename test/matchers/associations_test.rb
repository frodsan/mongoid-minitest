require 'test_helper'

describe Mongoid::Matchers::Associations do

  describe Person do
    subject { Person }

    it { must have_many(:pets) }
    it { wont have_many(:accounts) }

    it { must have_many(:pets).of_type(Pet) }
    it { wont have_many(:pets).of_type(Person) }
  end

  describe Pet do
    subject { Pet }

    it { must belong_to(:person) }
    it { wont belong_to(:problems) }

    it { must belong_to(:person).of_type(Person) }
    it { wont belong_to(:person).of_type(Pet) }
  end

end
