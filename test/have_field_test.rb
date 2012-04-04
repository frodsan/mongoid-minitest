require 'test_helper'

class HaveFieldTest < MiniTest::Unit::TestCase

  def test_assert_field_is_present
    assert_have_field(User, :name)
  end

end
