class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :trader, optional: true
  
  scope :posts_trader, -> (trader_id){ where("trader_id = ?", trader_id ) }
end
