class Board < ApplicationRecord
  belongs_to :user
  has_many :board_posts
  has_many :posts, through: :board_posts
end
