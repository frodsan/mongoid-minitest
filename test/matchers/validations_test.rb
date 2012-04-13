require "test_helper"

describe "Validations" do
  describe Person do
    subject { Person }

    it { must validate_presence_of(:name) }
    it { must validate_presence_of(:role).with_message("no role") }

    it { must validate_confirmation_of(:password) }

    it { must validate_uniqueness_of(:login).case_insensitive }
    it { must validate_uniqueness_of(:login).scoped_to(:site) }

    it { must validate_length_of(:login).in(5..12) }
    it { must validate_length_of(:login).within(5..12) }

    it { must validate_length_of(:password).with_min(8) }
    it { must validate_length_of(:password).with_minimum(8) }

    it { must validate_length_of(:password).with_max(16) }
    it { must validate_length_of(:password).with_maximum(16) }

    it { must validate_format_of(:email).to_allow("foo@bar.com") }
    it { must validate_format_of(:email).to_not_allow("foo_bar_com") }

    it { must validate_inclusion_of(:role).to_allow("user", "admin") }
    it { must validate_exclusion_of(:email).to_not_allow("foo@bar.com", "fizz@buzz.com") }
  end
end
