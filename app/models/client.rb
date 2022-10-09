class Client < ApplicationRecord
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :reviews
  has_many :favorites
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum work: { architecture: 0, others: 1 }
  enum is_deleted: { "in_use": false, "withdrawal": true }

  def self.guest
    # ゲストログイン時に自動でデータが登録される
    find_or_create_by!(email: 'guest_client@example.com') do |client|
      client.name = "ゲスト顧客"
      client.password = SecureRandom.urlsafe_base64
      client.telephone_number = "02699990909"
    end
  end

end
