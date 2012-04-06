class Person
  include Mongoid::Document
  include Mongoid::Paranoia

  field :name, type: String, default: "me"
end
