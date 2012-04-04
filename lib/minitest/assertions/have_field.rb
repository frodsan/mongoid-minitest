module MiniTest
  module Assertions
    def assert_have_field(klass, field_name, msg = nil)
      msg = message(msg) do
        msg = "Expected #{klass.name} to have field named #{field_name}"
        msg
      end

      assert klass.fields[field_name.to_s], msg

      true
    end
  end

  module Expectations
    infect_an_assertion :assert_have_field, :must_have_field, :reverse
  end
end

