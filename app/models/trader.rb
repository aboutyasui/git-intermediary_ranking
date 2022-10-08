class Trader < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews
  belongs_to :genre, optional: true
  #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

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

end
