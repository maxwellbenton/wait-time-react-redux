class StoreComment < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :comment
  belongs_to :wait_time
end
