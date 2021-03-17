class BoardPost < ApplicationRecord
  belongs_to :board
  belongs_to :post
  
  validates_uniqueness_of :post, :scope => :board

end
