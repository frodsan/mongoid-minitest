## 0.1.0 - unreleased

+ Support only Ruby 1.9.3.

## 0.0.3.1 - 31/05/2012

+ Change `have_index_for(indexed_field)` to work with `belongs_to :association, index: true`.
  Fixes [#7](https://github.com/frodsan/mongoid-minitest/issues/7).

## 0.0.3 - 04/15/2012

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

## 0.0.2 - 04/13/2012

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

## 0.0.1 - 04/12/2012

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
