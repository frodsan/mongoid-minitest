require "test_helper"

describe "HaveFieldMatcher" do
  subject { Dummy }

  it { must have_field(:name) }
  it { wont have_field(:noexist) }

  it { must have_field(:name).of_type(String) }
  it { wont have_field(:name).of_type(Integer) }

  it { must have_field(:name).with_default_value("me") }
  it { wont have_field(:name).with_default_value("nodefault") }
  it { must have_field(:name).of_type(String).with_default_value("me") }
  it { wont have_field(:name).of_type(String).with_default_value("nodefault") }
end
