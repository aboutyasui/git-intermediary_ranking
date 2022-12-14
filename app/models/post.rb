class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :trader, optional: true #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

  has_many :favorites, dependent: :destroy
  has_many :favorited_clients, through: :favorites, source: :client #ランキング用の仮想中間テーブル

  has_one_attached :image

  def written_by?(current_trader)
    trader == current_trader
  end

  def favorited_by?(client)
    self.favorites.exists?(client_id: client.id)
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
