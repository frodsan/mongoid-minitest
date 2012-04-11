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

Matchers are available at `Mongoid::Matchers` module.
Setup matchers according to your testing preferences:

### minitest/unit

    class MiniTest::Unit::TestCase
      include Mongoid::Matchers
    end

### minitest/spec

    class MiniTest::Spec
      include Mongoid::Matchers
    end

See the following examples:

    # minitest/unit
    class DummyTest < MiniTest::Unit::TestCase
      def test_matchers
        assert_must Dummy, have_field(:name)
        assert_wont Dummy, have_field(:none)
      end
    end

    # minitest/spec
    describe Dummy
      it "sould test matchers" do
        Dummy.must have_field(:name)
        Dummy.wont have_field(:none)
      end
    end

    # minitest/spec with subject
    describe Dummy
      it { must have_field(:name) }
      it { wont have_field(:none) }
    end

## Matchers

`Mongoid::Matchers` include the following modules:

    Module Mongoid
      Module Matchers
        include Mongoid::Matchers::Document
        include Mongoid::Matchers::Validations
      end
    end

### Document Matchers

    describe Mongoid::Matchers::Document do
      subject { Person }

      it { must be_document }
      it { must be_paranoid }
      it { must be_versioned }
      it { must be_timestamped }

      it { must have_field(:name) }
      it { wont have_field(:noexist) }

      it { must have_field(:name).of_type(String) }
      it { wont have_field(:name).of_type(Integer) }

      it { must have_field(:name).with_default_value("me") }
      it { wont have_field(:name).with_default_value("nodefault") }
      it { must have_field(:name).of_type(String).with_default_value("me") }
      it { wont have_field(:name).of_type(String).with_default_value("nodefault") }

      it { must have_fields(:name, :login) }
      it { wont have_fields(:noexist, :noexistagain) }
      it { must have_fields(:name, :login).of_type(String) }
      it { wont have_fields(:name, :login).of_type(Integer) }
      it { must have_fields(:name, :login).with_default_value("me") }
      it { must have_fields(:name, :login).of_type(String).with_default_value("me") }
    end

### Validations Matchers

    describe Mongoid::Matchers::Validations do
      subject { Person }

      it { must validate_presence_of(:name) }
      it { wont validate_presence_of(:age) }

      it { must validate_uniqueness_of(:login).case_insensitive }
      it { wont validate_uniqueness_of(:email).case_insensitive }

      it { must validate_length_of(:password).with_min(8) }
      it { wont validate_length_of(:password).with_min(0) }
      it { must validate_length_of(:password).with_minimum(8) }
      it { wont validate_length_of(:password).with_minimum(0) }
      it { must validate_length_of(:password).with_max(16) }
      it { wont validate_length_of(:password).with_max(8) }
      it { must validate_length_of(:password).with_maximum(16) }
      it { wont validate_length_of(:password).with_maximum(8) }

      it { must validate_format_of(:email) }
      it { wont validate_format_of(:password) }
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Unit Tests

To run unit tests, run `bundle exec rake` or `bundle exec guard` to run in auto mode.

## License

Copyright (c) 2012 Francesco Rodriguez

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Last words

At [EpicLabs](https://github.com/epiclabs/), We're migrating all the tests from `rspec` to `minitest`. I've been using
[mongoid-rspec gem](https://github.com/evansagge/mongoid-rspec) by [evanssage](https://github.com/evansagge).
So, this gem is heavily inspired in Evan's gem and [minitest-matchers](https://github.com/zenspider/minitest-matchers) gem
by [zenspider](https://github.com/zenspider). We love [minitest](https://github.com/seattlerb/minitest) and
we hope that this will be helpful for you. Thanks!

