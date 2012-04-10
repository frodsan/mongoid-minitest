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

Include `Mongoid::MiniTest::Matchers`:

    class MiniTest::Unit::TestCase
      include Mongoid::MiniTest::Matchers
    end

or

    class MiniTest::Spec
      include Mongoid::MiniTest::Matchers
    end

### Using minitest/spec with subject

    describe Dummy do
      subject { Dummy }

      it { must be_document }    # if model includes Mongoid::Document
      it { must be_paranoid }    # if model includes Mongoid::Paranoia
      it { must be_versioned }   # if model includes Mongoid::Versioning
      it { must be_timestamped } # if model includes Mongoid::Timestamps

      it { must have_field(:name) }
      it { wont have_field(:noexist) }

      it { must have_field(:name).of_type(String) }
      it { wont have_field(:name).of_type(Integer) }

      it { must have_field(:name).with_default_value("me") }
      it { wont have_field(:name).with_default_value("nodefault") }
      it { must have_field(:name).of_type(String).with_default_value("me") }
      it { wont have_field(:name).of_type(String).with_default_value("nodefault") }

      it { must have_fields(:name, :nick) }
      it { wont have_fields(:noexist, :neverexist) }
      it { must have_fields(:name, :nick).of_type(String) }
      it { must have_fields(:name, :nick).with_default_value("me") }
      it { must have_fields(:name, :nick).of_type(String).with_default_value("me") }
    end

If you don't like this approach, you can use `assert_must(klass, matcher)` for
`MiniTest::Unit::TestCase` like:

    def test_fields
      assert_must Dummy, have_field(:name)
      assert_wont Dummy, have_field(:noexist)
    end

or, for `MiniTest::Spec`, like:

    it "should test fields" do
      Dummy.must have_field(:name)
      Dummy.wont have_field(:noexist)
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

At my job, We're migrating all the tests from `rspec` to `minitest`. I've been using
[mongoid-rspec gem](https://github.com/evansagge/mongoid-rspec) by [evanssage](https://github.com/evansagge).
So, this gem is heavily inspired in Evan's gem and [minitest-matchers](https://github.com/zenspider/minitest-matchers)
by [zenspider](https://github.com/zenspider). We love [minitest](https://github.com/seattlerb/minitest) and
we hope that this will be helpful for you. Thanks!

