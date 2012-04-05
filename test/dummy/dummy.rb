class Dummy
  include Mongoid::Document

  field :name, type: String, default: "me"
end
