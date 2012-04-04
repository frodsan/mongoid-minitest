require 'test_helper'

class HaveFieldTest < UnitTest

  def test_have_field_is_true
    assert have_field(User, :name)
  end


end
