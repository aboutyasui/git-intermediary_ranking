class Trader < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews
  belongs_to :genre, optional: true#optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

  has_one_attached :profile_image

  def get_profile_image(width, height)
    #unless profile_image.attached?
      #file_path = Rails.root.join('app/assets/images/leader_sagyouin_woman.jpg')
      #profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    #end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted: { "in_use": false, "withdrawal": true }

  def self.guest
    # ゲストログイン時に自動でデータが登録される
    find_or_create_by!(email: 'guest_trader@example.com') do |trader|
      trader.name = "ゲスト業者"
      trader.password = SecureRandom.urlsafe_base64
      trader.genre_id = 1
      trader.telephone_number = "52789980949"
    end
  end

  ##評価点の平均値
  def review_average(trader)
    if trader.reviews.count >= 1
      reviews=Review.where(trader_id: trader.id).pluck(:star)#starカラムに保存されている評価点数（文字列型）を取得
      reviews.map!(&:to_i)#取得した変数（reviews）を数列型へ変更する
      reviews.sum.fdiv(reviews.length).round(1)#取得した変数をもとに平均値を算出
      #round(1)とすることで小数点第2位に対して四捨五入をします。
    else
      0.0
    end
  end

  ##検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @trader = Trader.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @trader = Trader.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @trader = Trader.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @trader = Trader.where("name LIKE?","%#{word}%")
    else
      @trader = Trader.all
    end
  end

end
