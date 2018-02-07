class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :wait_times
  has_many :store_comments

  

  # has_many :users, through: :wait_times

  # has_many :comments, through: :store_comments

end
