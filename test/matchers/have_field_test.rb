require "test_helper"

describe "Document matchers" do

  it "should assert to true if field exists" do
    assert_must Dummy, have_field(:name)
    Dummy.must have_field(:name)
  end
end
