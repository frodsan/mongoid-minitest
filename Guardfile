guard 'minitest' do
  watch(%r|^test/(.*)_test\.rb|)
  watch(%r|^test/test_helper\.rb|)      { "test" }
  watch(%r|^test/models/(.*)\.rb|)      { "test" }
  watch(%r|^lib/minitest/matchers\.rb|) { "test" }
  watch(%r|^lib/mongoid-minitest\.rb|)  { "test" }

  watch(%r|^lib/matchers/helpers\.rb|)     { "test" }
  watch(%r|^lib/matchers/document/(.*)\.rb|)     { "test/matchers/document_test.rb" }
  watch(%r|^lib/matchers/validations/(.*)\.rb|)  { "test/matchers/validations_test.rb" }
  watch(%r|^lib/matchers/associations/(.*)\.rb|) { "test/matchers/associations_test.rb" }
end
