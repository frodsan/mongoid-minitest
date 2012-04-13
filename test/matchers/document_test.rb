require "test_helper"

describe Mongoid::Matchers::Document do
  subject { Person }

  it { must be_document }
  it { must be_paranoid }
  it { must be_versioned }
  it { must be_timestamped }

  it { must be_stored_in(:people) }
  it { wont be_stored_in(:pets) }

  it { must have_field(:name) }
  it { wont have_field(:noexist) }

  it { must have_field(:name).of_type(String) }
  it { wont have_field(:name).of_type(Integer) }

  it { must have_field(:name).with_default_value("me") }
  it { wont have_field(:name).with_default_value("nodefault") }
  it { must have_field(:name).of_type(String).with_default_value("me") }
  it { wont have_field(:name).of_type(String).with_default_value("nodefault") }

  it { must have_fields(:name, :login) }
  it { wont have_fields(:noexist, :noexistagain) }
  it { must have_fields(:name, :login).of_type(String) }
  it { wont have_fields(:name, :login).of_type(Integer) }
  it { must have_fields(:name, :login).with_default_value("me") }
  it { must have_fields(:name, :login).of_type(String).with_default_value("me") }
end
