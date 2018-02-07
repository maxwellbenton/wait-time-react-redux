class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :wait_times

  has_many :store_comments
  has_many :stores, through: :wait_times

end
