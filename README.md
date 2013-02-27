mongoid-minitest
================

MiniTest matchers for Mongoid.

[![Build Status](https://secure.travis-ci.org/frodsan/mongoid-minitest.png?branch=master&.png)](http://travis-ci.org/frodsan/mongoid-minitest)
[![Dependency Status](https://gemnasium.com/frodsan/mongoid-minitest.png)](https://gemnasium.com/frodsan/mongoid-minitest)
[![Code Climate](https://codeclimate.com/github/frodsan/mongoid-minitest.png)](https://codeclimate.com/github/frodsan/mongoid-minitest)

Support
-------

This gem supports:

* Ruby 1.9.3, 2.0.0, ruby-head, rbx-19mode, jruby-19mode.
* Mongoid ~>3.0, Mongoid 4.0 edge (Use mongoid/mongoid Github repository).
* MiniTest ~>4.1.

**NOTE:** Version 2.0.x will remove support for Mongoid 3.x.

Installation
------------

Add this line to your application's Gemfile:

    gem 'mongoid-minitest', group: :test

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-minitest

Usage
-----

Require `mongoid-minitest` in your `test_helper.rb` or
`spec_helper.rb` file:

    require 'minitest/autorun'
    require 'mongoid'
    require 'mongoid-minitest'

Matchers are available at `Mongoid::Matchers` module.
Setup matchers according to your testing preference:

### minitest/unit

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
      it { must have_field(:name) }
      it { wont have_field(:none) }
    end

Matchers
--------

`Mongoid::Matchers` include the following modules:

    Module Mongoid
      Module Matchers
        include Document
        include Associations
        include MiniTest::Matchers::ActiveModel
      end
    end

**NOTE:** [minitest-activemodel](https://github.com/frodsan/minitest-activemodel)
gem is a dependency of this gem.

### Document Matchers

    describe Mongoid::Matchers::Document do
      subject { Person }

      it { must be_document }    # if model includes Mongoid::Document
      it { must be_paranoid }    # if model includes Mongoid::Paranoia   (Only in Mongoid <= 4.0.0)
      it { must be_versioned }   # if model includes Mongoid::Versioning (Only in Mongoid <= 4.0.0)
      it { must be_timestamped } # if model includes Mongoid::Timestamps

      it { must be_stored_in(:people) } # checks the collection for model's document

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

### Association Matchers

    describe Mongoid::Matchers::Associations do
      describe Person do
        subject { Person }

        it { must have_one(:account) }
        it { must have_many(:pets).of_type(Pet) }
        it { must have_and_belong_to_many(:friends) }

        it { must embed_one(:profile) }
        it { must embed_many(:sites) }
      end

      describe Pet do
        subject { Pet }

        it { must belong_to(:person) }
      end

      describe Site do
        subject { Site }

        it { must embedded_in(:person) }
      end
    end

### Validation Matchers

Check [minitest-activemodel](https://github.com/frodsan/minitest-activemodel)
gem for more information.

Contributing
------------

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Added some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create new Pull Request.

Unit Tests
----------

To run unit tests, run `rake test`.

Maintainers
-----------

* Francesco Rodriguez (https://github.com/frodsan/).
* Sascha Wessel (https://github.com/gr4y).
* Godfrey Chan (https://github.com/chancancode).
* Ryan McGeary (https://github.com/rmm5t).

License
-------

MIT License. Copyright 2012 Francesco Rodriguez. See [LICENSE](https://github.com/frodsan/lego/blob/master/LICENSE)
for more information.
