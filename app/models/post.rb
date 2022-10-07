class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :trader, optional: true #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

  def favorited_by?(client)
    favorites.exists?(client_id: client.id)
  end

  #scope :posts_trader, -> (trader_id){ where("trader_id = ?", trader_id ) }
end
