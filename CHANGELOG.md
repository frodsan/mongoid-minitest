## 1.0.0 - unreleased

+ Extract Validation Matchers to [minitest-activemodel](https://github.com/frodsan/minitest-activemodel) gem.

  Breaking changes:

  + `validate_format_of(:email).to_allow(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/)` is not supported.
    Use `validate_format_of(:email).to_allow('frodsan@me.com')` instead.

  *Francesco Rodriguez*

+ Add support for JRuby 1.9 mode - *Francesco Rodriguez*.

+ Add support for Ruby 2.0.0, ruby-head and rbx-19mode - *Francesco Rodriguez*.

+ Add support for Mongoid 4 edge - *Francesco Rodriguez*.

+ Remove instance variable warnings.
  Pull Request [#17](https://github.com/frodsan/mongoid-minitest/pull/17) - *Ryan McGeary*.

## 0.1.5 - February 26, 2013

+ Add Ruby 2.0.0 support - *Francesco Rodriguez*.

+ Make mongoid version more flexible in gemspec.
  Pull Request [#16](https://github.com/frodsan/mongoid-minitest/pull/16) - *Ryan McGeary*.

+ Add compound indexes support for `have_index` matcher.
  Pull Request [#15](https://github.com/frodsan/mongoid-minitest/pull/15) - *Ryan McGeary*.

+ Remove support for automatically appending `_id` to fields passed to
  `have_index` matcher. See <https://github.com/frodsan/mongoid-minitest/pull/15#issuecomment-11851098>
  for more information - *Ryan McGeary*.

## 0.1.4 - October 10, 2012

+ Bump mongoid version to 3.0.6 - *Francesco Rodriguez*.

+ Bump minitest version to >= 4.0.0 - *Francesco Rodriguez*.

## 0.1.3 - September 8, 2012

+ Bump mongoid version to 3.0.5 - *Francesco Rodriguez*.

+ Bump minitest version to 3.4.0 - *Francesco Rodriguez*.

+ Added on option for validation matchers.
  Pull Request [#14](https://github.com/frodsan/mongoid-minitest/pull/14) - *Godfrey Chan*.

## 0.1.2 - August 13, 2012

+ Allow passing in a Regex to the validate_format_of matcher.
  Pull Request [#12](https://github.com/frodsan/mongoid-minitest/pull/12) - *Godfrey Chan*.

+ Allow non-array values for inclusion/exclusion matchers.
  Pull Request [#11](https://github.com/frodsan/mongoid-minitest/pull/11) - *Godfrey Chan*.

+ Added as_inverse_of for association matchers.
  Pull Request [#10](https://frodsan/mongoid-minitest/pull/10) - *Godfrey Chan*.

+ Use [minitest-matchers](https://github.com/zenspider/minitest-matchers) gem
  instead of our matchers implementation - *Francesco Rodriguez*.

+ Bump mongoid version to 3.0.4 - *Francesco Rodriguez*.

## 0.1.1 - August 09, 2012

+ Remove required ruby version from the gemspec. Fixes [#9](https://github.com/frodsan/mongoid-minitest/pull/9). *Francesco Rodriguez*

## 0.1.0 - August 09, 2012

+ Change support to only Ruby 1.9.3.

+ Bump mongoid version to 3.0.2 and minitest version to 3.3.0 and minitest version
  to 3.3.0 - *Sascha Wessel*.

## 0.0.3.1 - May 31, 2012

+ Change `have_index_for(indexed_field)` to work with `belongs_to :association, index: true`.
  Fixes [#7](https://github.com/frodsan/mongoid-minitest/issues/7).

## 0.0.3 - April 15, 2012

+ Add `have_index_for(indexed_field)` document matcher.

+ Add `embedded_in(association_name)` association matcher.

+ Add `embed_many(association_name)` association matcher.

+ Fix issue check `association_type` if metadata is not nil.

+ Add `embed_one(association_name)` association matcher.

+ Add `have_and_belong_to_many(association_name)` association matcher.

+ Add `validate_associated(association_name)` validation matcher.

+ Add `accept_with(value)` chain matcher to `validate_acceptance_of`.

+ Add `validate_acceptance_of(field)` validation matcher.

+ Add `validate_confirmation_of(field)` validation matcher.

## 0.0.2 - April 13, 2012

+ Add `have_one(association_name)` association matcher.

+ Add `in(range)` alias to `within` matcher.

+ Add `within(range)` chain matcher to `validate_length_of`.

+ Add `scoped_to(*scope)` chain matcher to `validate_uniqueness_of`

+ Add `with_message(custom_message)` chain matcher for validation matchers to test
  custom messages.

+ Add `DocumentModuleMatcher` class to simplify document matchers.

+ Add `be_stored_in(collection_name)` document matcher.

+ Add `to_allow(values)` chain matcher to `validate_inclusion_of`.

+ Add `validate_inclusion_of(field)` validation matcher.

+ Add `belong_to(association_name)` association matcher.


## 0.0.1 - April 12, 2012

+ Add `of_type(type)` chain matcher to association matcher.

+ Add `have_many(association_name)` association matcher.

+ Add `Mongoid::Matchers::Associations` module.

+ Add `to_not_allow(*values)` chain matcher to `validate_exclusion_of`.

+ Add `validate_exclusion_of(field)` validation matcher.

+ Add `to_not_allow(*values)` matcher to `validate_format_of`.

+ Add `to_allow(*values)` matcher to `validate_format_of`.

+ Add `validate_format_of(field)` validation matcher.

+ Add `with_max(value)` alias to `with_maximum` matcher.

+ Add `with_maximum(value)` chain matcher to `validate_length_of`

+ Add `with_min(value)` alias to `with_minimum` matcher.

+ Add `with_minimum(value)` matcher to `validate_length_of`.

+ Add `validate_length_of(field)` validation matcher.

+ Add `case_sensitive` chain matcher to `validate_uniqueness_of`.

+ Add `validate_uniqueness_of(field)` validation matcher.

+ Add `validate_presence_of(field)` validation matcher.

+ Add `have_fields(*fields)` document matcher.

+ Add `be_timestamped` document matcher.

+ Add `be_versioned` document matcher.

+ Add `be_paranoid` document matcher.

+ Add `be_document` document matcher.

+ Add `with_default_value(default)` chain matcher to `have_field`.

+ Add `of_type(type)` chain matcher to `have_field`.

+ Add `must` and `wont` methods to `MiniTest::Spec`.

+ Add `have_field(field)` document matcher.

+ Add default failure messages based on description matcher.

+ Add `must` and `wont` expectations.

+ Add `assert_must` and `assert_wont` to `MiniTest::Assertions`.
