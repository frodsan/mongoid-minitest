# mongoid-minitest

MiniTest matchers for Mongoid.

**First release: 10/04/2012** - 1 week! :grin:

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-minitest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-minitest

## Usage

Example:

    class Dummy
      include Mongoid::Document

      field :name, type: String, default: "me"
    end

### Using minitest/unit

    class DummyTest < MiniTest::Unit::TestCase
      include Mongoid::MiniTest::Matchers

      def test_have_fields
        assert_must Dummy, have_field(:name)
        assert_wont Dummy, have_field(:noexist)
        
        assert_must Dummy, have_field(:name).of_type(String)
        assert_wont Dummy, have_field(:name).of_type(Integer)

        assert_must Dummy, have_field(:name).with_default_value("me")
        assert_wont Dummy, have_field(:name).with_default_value("nodefault")
        assert_must Dummy, have_field(:name).of_type(String).with_default_value("me")
      end
    end

### Using minitest/spec

    describe Dummy do
      it "validates fields" do
        Dummy.must have_field(:name)
        Dummy.wont have_field(:noexist)

        Dummy.must have_field(:name).of_type(String)
        Dummy.wont have_field(:name).of_type(Integer)

        Dummy.must have_field(:name).with_default_value("me")
        Dummy.wont have_field(:name).with_default_value("nodefault")
        Dummy.must have_field(:name).of_type(String).with_default_value("me")
      end
    end

### Using minitest/spec with subject

    describe Dummy do
      subject { Dummy }

      it { must have_field(:name) }
      it { wont have_field(:noexist) }

      it { must have_field(:name).of_type(String) }
      it { wont have_field(:name).of_type(Integer) }

      it { must have_field(:name).with_default_value("me") }
      it { wont have_field(:name).with_default_value("nodefault") }
      it { must have_field(:name).of_type(String).with_default_value("me") }
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Unit Tests

To run unit tests, run `bundle exec rake`.
