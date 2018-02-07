class StoreCommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :store_id, :wait_time_id, :comment

  def user
    object.user.slice(:id, :username)
  end

  def store
    object.store.slice(:id, :name)
  end


  # belongs_to :user
  # belongs_to :store
  # belongs_to :comment
  # belongs_to :wait_time
end
