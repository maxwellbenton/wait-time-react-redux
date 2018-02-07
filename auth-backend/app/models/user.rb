class User < ApplicationRecord
  has_secure_password
  has_many :wait_times
  has_many :store_comments
  has_many :stores, through: :wait_times

end
