class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :trader, optional: true #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

  has_many :favorites, dependent: :destroy
  has_many :favorited_clients, through: :favorites, source: :client #ランキング用の仮想中間テーブル

  has_one_attached :image

  def get_image
    #unless image.attached?
    #  file_path = Rails.root.join('app/assets/images/20200502_noimage.jpg')
    #  image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    #end
    image#.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(client)
    favorites.exists?(client_id: client.id)
  end

  ##検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
