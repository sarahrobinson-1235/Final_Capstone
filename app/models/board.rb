class Board < ApplicationRecord
  belongs_to :user
  has_many :board_posts, dependent: :destroy
  has_many :posts, through: :board_posts
  
  validates :title, presence: true
  validates :description, presence: true
  
end
