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

      field :name
    end

### Using minitest/unit

    class DummyTest < MiniTest::Unit::TestCase
      include Mongoid::MiniTest::Matchers

      def test_have_fields
        assert_must Dummy, have_field(:name)
        assert_wont Dummy, have_field(:noexist) 
      end
    end

### Using minitest/spec

    describe Dummy do
      it "validates fields" do
        Dummy.must have_field(:name)
        Dummy.wont have_field(:noexist)
      end
    end

## Using minitest/spec with subject

    describe Dummy do
      subject { Dummy }

      it { must have_field(:name) }
      it { wont have_field(:noexist) }
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Unit Tests

To run unit tests, run `bundle exec rake`.
