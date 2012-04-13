# mongoid-minitest [![Build Status](https://secure.travis-ci.org/frodsan/mongoid-minitest.png?branch=master&.png)](http://travis-ci.org/frodsan/mongoid-minitest) [![Dependency Status](https://gemnasium.com/frodsan/mongoid-minitest.png)](https://gemnasium.com/frodsan/mongoid-minitest)

MiniTest matchers for Mongoid.  

* Compatible with Ruby >=1.9.2.
* Tested on MiniTest 2.x

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-minitest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-minitest

## Usage

Matchers are available at `Mongoid::Matchers` module.  
Setup matchers according to your testing preference:

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
        include Mongoid::Matchers::Associations
      end
    end

### Document Matchers

    describe Mongoid::Matchers::Document do
      subject { Person }

      it { must be_document }    # if model includes Mongoid::Document
      it { must be_paranoid }    # if model includes Mongoid::Paranoia
      it { must be_versioned }   # if model includes Mongoid::Versioning
      it { must be_timestamped } # if model includes Mongoid::Timestamps

      it { must be_stored_in(:people) } # checks the collection for model's document

      it { must have_field(:name) }
      it { must have_field(:name).of_type(String) }
      it { must have_field(:name).with_default_value("me") }
      it { must have_field(:name).of_type(String).with_default_value("me") }

      it { must have_fields(:name, :login) }
      it { must have_fields(:name, :login).of_type(String) }
      it { must have_fields(:name, :login).with_default_value("me") }
      it { must have_fields(:name, :login).of_type(String).with_default_value("me") }
    end

### Validations Matchers

    describe Mongoid::Matchers::Validations do
      subject { Person }

      it { must validate_presence_of(:name) }

      it { must validate_uniqueness_of(:login).case_insensitive }

      it { must validate_length_of(:password).with_min(8) }
      it { must validate_length_of(:password).with_minimum(8) }
      it { must validate_length_of(:password).with_max(16) }
      it { must validate_length_of(:password).with_maximum(16) }

      it { must validate_format_of(:email).to_allow("foo@bar.com") }
      it { must validate_format_of(:email).to_not_allow("foo_bar_com") }

      it { must validate_inclusion_of(:role).to_allow("user", "admin") }
      it { must validate_exclusion_of(:email).to_not_allow("foo@bar.com", "fizz@buzz.com") }

      # Testing validators custom messages
      it { must validate_presence_of(:role).with_message("no role") }
      it { must validate_length_of(:password).with_min(8).with_message("len >= 8") }
    end

### Association Matchers

    describe Mongoid::Matchers::Associations do
      describe "parent" do
        subject { Person }

        it { must have_many(:pets).of_type(Pet) }
      end

      describe "child" do
        subject { Pet }

        it { must belong_to(:person).of_type(Person) }
      end
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
