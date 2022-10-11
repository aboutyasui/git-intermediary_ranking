class Trader < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews
  belongs_to :genre, optional: true#optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/20200502_noimage.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
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

end
