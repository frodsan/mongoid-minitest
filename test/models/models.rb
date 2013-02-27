class Person
  include Mongoid::Document
  include Mongoid::Timestamps
  unless Mongoid::VERSION == '4.0.0'
    include Mongoid::Paranoia
    include Mongoid::Versioning
  end

  field :login,    type: String,  default: 'me'
  field :password, type: String
  field :name,     type: String,  default: 'me'
  field :age,      type: Integer
  field :email,    type: String
  field :role,     type: String
  field :site,     type: String

  index({ name: 1 }, { name: 'name' })
  index({ email: 1, login: 1 })

  has_one :account
  has_many :pets, inverse_of: :owner
  has_and_belongs_to_many :friends, class_name: 'Person'

  embeds_one :profile
  embeds_many :sites
end

class Pet
  include Mongoid::Document

  belongs_to :owner, class_name: 'Person', index: :true
end

class Account
  include Mongoid::Document

  belongs_to :person
end

class Profile
  include Mongoid::Document
end

class Site
  include Mongoid::Document

  embedded_in :person
end
