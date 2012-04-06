require "test_helper"

describe "Document matchers" do
  subject { Person }

  it { must be_document }
  it { must be_paranoid }
end
