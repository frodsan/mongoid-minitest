require "test_helper"

describe "Document matchers" do
  subject { Dummy }

  it { must be_document }
end
