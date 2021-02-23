class Post < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true 
  # validates :body, length: {in: 10..60}
  
  
  belongs_to :user
  has_many :board_posts
  has_many :boards, through: :board_posts
end
