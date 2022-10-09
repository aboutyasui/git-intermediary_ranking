class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :trader, optional: true #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/20200502_noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image#.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(client)
    favorites.exists?(client_id: client.id)
  end

  #scope :posts_trader, -> (trader_id){ where("trader_id = ?", trader_id ) }
end
