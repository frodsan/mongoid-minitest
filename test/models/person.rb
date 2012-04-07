class Person
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps

  field :name, type: String, default: "me"
  field :nick, type: String, default: "me"
end
