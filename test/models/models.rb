class Person
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps

  field :login,    type: String,  default: "me"
  field :password, type: String
  field :name,     type: String,  default: "me"
  field :age,      type: Integer
  field :email,    type: String
  field :role,     type: String
  field :site,     type: String

  has_many :pets
  has_one :account

  validates_presence_of(:name)
  validates_presence_of(:role, message: "no role")
  validates_uniqueness_of(:email)
  validates_uniqueness_of(:login, scope: :site, case_sensitive: false)
  validates_length_of(:password, minimum: 8, maximum: 16)
  validates_length_of(:login, in: 5..12)
  validates_format_of(:email, with: /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i)
  validates_inclusion_of(:role, in: ["admin", "user"])
  validates_exclusion_of(:email, in: ["foo@bar.com", "fizz@buzz.com"])
end

class Pet
  include Mongoid::Document

  belongs_to :person
end

class Account
  include Mongoid::Document

  belongs_to :person
end
