require "test_helper"

describe "HaveFieldMatcher" do
  describe "#must" do
    it "passes if the field exists" do
      assert_must Dummy, have_field(:name)
      Dummy.must have_field(:name)
    end

    it "raises an error when the field doesn't exist" do
      assert_failure(failure_message) do
        assert_must Dummy, have_field(:noexist)
      end

      assert_failure(failure_message) do
        Dummy.must have_field(:noexist)
      end
    end
  end

  describe "#wont" do
    it "passes if the field doesn't exist" do
      assert_wont Dummy, have_field(:noexist)
      Dummy.wont have_field(:noexist)
    end

    it "raises an error when the field exists" do
      assert_failure(negative_failure_message) do
        assert_wont Dummy, have_field(:name)
      end

      assert_failure(negative_failure_message) do
        Dummy.wont have_field(:name)
      end
    end
  end

  private

  def failure_message
    "Expected Dummy to have field named noexist, got no field named noexist."
  end

  def negative_failure_message
    "Expected Dummy to not have field named name, got Dummy to have field named name."
  end
end
