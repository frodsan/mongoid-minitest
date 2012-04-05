module MiniTest
  module Assertions
    def assert_must(subject, matcher, msg = nil)
      msg = message(msg) { matcher.failure_message }
      assert matcher.matches?(subject), msg
    end

    def assert_wont(subject, matcher, msg = nil)
      msg = message(msg) { matcher.negative_failure_message }
      refute matcher.matches?(subject), msg
    end
  end

  module Expectations
    infect_an_assertion :assert_must, :must, :reverse
    infect_an_assertion :assert_wont, :wont, :reverse
  end
end

class MiniTest::Spec
  def must(*args, &block)
    subject.must(*args, &block)
  end

  def wont(*args, &block)
    subject.wont(*args, &block)
  end
end
