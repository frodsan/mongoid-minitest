class Person
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps

  field :code,     type: String
  field :name,     type: String,  default: "me"
  field :login,    type: String,  default: "me"
  field :password, type: String
  field :age,      type: Integer

  validates_presence_of(:name)
  validates_uniqueness_of(:code)
  validates_uniqueness_of(:login, case_sensitive: false)

  validates_length_of(:password, minimum: 8, maximum: 16)
end
