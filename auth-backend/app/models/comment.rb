class Comment < ApplicationRecord
  has_many :store_comments
  has_many :stores, through: :store_comments
end
