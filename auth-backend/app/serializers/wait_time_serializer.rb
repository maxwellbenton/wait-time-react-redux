class WaitTimeSerializer < ActiveModel::Serializer
  attributes :id, :wait_time
  has_one :user
  has_one :store
end
