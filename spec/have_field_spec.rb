require "spec_helper"

describe "have_field assertion" do

  it "should assert if a field exists" do
    assert_have_field Puppet, :name
    Puppet.must_have_field :name
  end

  it "raises an error when a field not exist" do
    assert_failure { assert_have_field Puppet, :noexist }
    assert_failure { Puppet.must_have_field :noexist }
  end

end
