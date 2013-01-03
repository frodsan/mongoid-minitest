require 'test_helper'

describe 'Document' do
  describe Person do
    subject { Person }

    it { must be_document }
    it { must be_paranoid }
    it { must be_versioned }
    it { must be_timestamped }

    it { must be_stored_in(:people) }

    it { must have_field(:name).of_type(String).with_default_value('me') }
    it { must have_fields(:name, :login).of_type(String).with_default_value('me') }

    it { must have_index_for(:name) }
  end

  describe Pet do
    subject { Pet }

    it { must have_index_for(:owner_id) }
  end
end
