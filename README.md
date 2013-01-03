# mongoid-minitest

MiniTest matchers for Mongoid.

[![Build Status](https://secure.travis-ci.org/frodsan/mongoid-minitest.png?branch=master&.png)](http://travis-ci.org/frodsan/mongoid-minitest)

## Support

This gem supports:

* Ruby 1.9.3
* Mongoid ~>3.0.4
* MiniTest ~>3.4.0

If you're using Mongoid 2.4.x, you should use [0.0.3.1 version](https://github.com/frodsan/mongoid-minitest/tree/274976e8814cc9bfb3f1c83eba1bed21fa3cf26b).

## Installation

Add this line to your application's Gemfile:

    gem "mongoid-minitest"

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
      it "should test matchers" do
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
        include Document
        include Validations
        include Associations
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

      it { must have_index_for(:name) }
      it { must have_index_for(:account_id, :email) }
    end

### Validation Matchers

    describe Mongoid::Matchers::Validations do
      subject { Person }

      it { must validate_presence_of(:name) }

      it { must validate_uniqueness_of(:login).case_insensitive }
      it { must validate_uniqueness_of(:login).scoped_to(:site) }

      it { must validate_length_of(:login).in(5..12) }
      it { must validate_length_of(:login).within(5..12) }

      it { must validate_length_of(:password).with_min(8) }
      it { must validate_length_of(:password).with_minimum(8) }
      it { must validate_length_of(:password).with_max(16) }
      it { must validate_length_of(:password).with_maximum(16) }

      it { must validate_format_of(:email).to_allow("foo@bar.com") }
      it { must validate_format_of(:email).to_not_allow("foo_bar_com") }

      it { must validate_inclusion_of(:role).to_allow("user", "admin") }
      it { must validate_exclusion_of(:email).to_not_allow("foo@bar.com", "fizz@buzz.com") }

      it { must validate_confirmation_of(:password) }
      it { must validate_acceptance_of(:terms_of_use).accept_with("1") }

      it { must validate_associated(:pets) }

      # Testing validators custom messages
      it { must validate_presence_of(:role).with_message("no role") }
      it { must validate_length_of(:password).with_min(8).with_message("len >= 8") }
    end

### Association Matchers

    describe Mongoid::Matchers::Associations do
      describe Person do
        subject { Person }

        it { must have_one(:account) }
        it { must have_many(:pets).of_type(Pet) }
        it { must have_and_belong_to_many(:friends) }

        it { must embed_one(:profile) }
        it { must embed_many(:sites) }
      end

      describe Pet do
        subject { Pet }

        it { must belong_to(:person) }
      end

      describe Site do
        subject { Site }

        it { must embedded_in(:person) }
      end
    end

## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Added some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create new Pull Request.

## Unit Tests

To run unit tests, run `bundle exec rake`.

## Maintainers

* Francesco Rodriguez (https://github.com/frodsan/).
* Sascha Wessel (https://github.com/gr4y).
* Godfrey Chan (https://github.com/chancancode).

## License

MIT License. Copyright 2012 Francesco Rodriguez. See [LICENSE](https://github.com/frodsan/lego/blob/master/LICENSE)
for more information.
