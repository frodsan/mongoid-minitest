class Person
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning

  field :name, type: String, default: "me"
end
