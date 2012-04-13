module MiniTest
  module Assertions
    def assert_must(subject, matcher, msg = nil)
      msg = message(msg) do
        if matcher.respond_to? :failure_message
          "Expected #{matcher.failure_message}".squeeze(" ")
        else
          "Expected #{subject.inspect} to #{matcher.description}".squeeze(" ")
        end
      end

      assert matcher.matches?(subject), msg
    end

    def assert_wont(subject, matcher, msg = nil)
      msg = message(msg) do
        if matcher.respond_to? :negative_failure_message
          "Expected #{matcher.negative_failure_message}".squeeze(" ")
        else
          "Expected not to #{matcher.description}".squeeze(" ")
        end
      end

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
