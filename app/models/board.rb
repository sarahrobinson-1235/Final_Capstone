class Board < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  # validates :description, length: {5..25}
  
  belongs_to :user
  has_many :board_posts, dependent: :destroy
  has_many :posts, through: :board_posts
end
