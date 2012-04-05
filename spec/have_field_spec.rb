require "spec_helper"

describe "Document matchers" do
  include Mongoid::MiniTest::Matchers

  it "should" do
    assert_must have_field(:name), Dummy
    Dummy.must have_field(:name)
  end
end
