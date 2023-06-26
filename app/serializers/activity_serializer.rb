class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty

  has_many :signups, serializer: SignupSerializer
  
end
