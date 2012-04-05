require "test_helper"

describe "HaveFieldMatcher" do
  subject { Dummy }

  it { must have_field(:name) }
  it { wont have_field(:noexist) }

  it { must have_field(:name).of_type(String) }
  it { wont have_field(:name).of_type(Integer) }
end
