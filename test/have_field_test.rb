require "test_helper"

describe "Document matchers" do
  include Mongoid::MiniTest::Matchers

  it "should" do
    assert_must Dummy, have_field(:name)
    Dummy.must have_field(:name)
  end
end
