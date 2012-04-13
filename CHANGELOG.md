### 0.0.3

+ Added `validates_confirmation_of(field)` validation matcher.

### 0.0.2 - 04/13/2012

+ Added `have_one(association_name)` association matcher.
+ Added `in(range)` alias to `within` matcher.
+ Added `within(range)` chain matcher to `validate_length_of`.
+ Added `scoped_to(*scope)` chain matcher to `validate_uniqueness_of`
+ Added `with_message(custom_message)` chain matcher for validation matchers to test custom messages.
+ Added `DocumentModuleMatcher` class to simplify document matchers.
+ Added `be_stored_in(collection_name)` document matcher.
+ Added `to_allow(values)` chain matcher to `validate_inclusion_of`.
+ Added `validate_inclusion_of(field)` validation matcher.
+ Added `belong_to(association_name)` association matcher.

### 0.0.1 - 04/11/2012

+ Added `of_type(type)` chain matcher to association matcher.
+ Added `have_many(association_name)` association matcher.
+ Added `Mongoid::Matchers::Associations` module.
+ Added `to_not_allow(*values)` chain matcher to `validate_exclusion_of`.
+ Added `validate_exclusion_of(field)` validation matcher.
+ Added `to_not_allow(*values)` matcher to `validate_format_of`.
+ Added `to_allow(*values)` matcher to `validate_format_of`.
+ Added `validate_format_of(field)` validation matcher.
+ Added `with_max(value)` alias to `with_maximum` matcher.
+ Added `with_maximum(value)` chain matcher to `validate_length_of`
+ Added `with_min(value)` alias to `with_minimum` matcher.
+ Added `with_minimum(value)` matcher to `validate_length_of`.
+ Added `validate_length_of(field)` validation matcher.
+ Added `case_sensitive` chain matcher to `validate_uniqueness_of`.
+ Added `validate_uniqueness_of(field)` validation matcher.
+ Added `validate_presence_of(field)` validation matcher.
+ Added `have_fields(*fields)` document matcher.
+ Added `be_timestamped` document matcher.
+ Added `be_versioned` document matcher.
+ Added `be_paranoid` document matcher.
+ Added `be_document` document matcher.
+ Added `with_default_value(default)` chain matcher to `have_field`.
+ Added `of_type(type)` chain matcher to `have_field`.
+ Added `must` and `wont` methods to `MiniTest::Spec`.
+ Added `have_field(field)` document matcher.
+ Added default failure messages based on description matcher.
+ Added `must` and `wont` expectations.
+ Added `assert_must` and `assert_wont` to `MiniTest::Assertions`.
