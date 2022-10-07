class Client < ApplicationRecord
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :reviews
  has_many :favorites
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum work: { architecture: 0, others: 1 }

  def self.guest
    # ゲストログイン時に自動でデータが登録される
    find_or_create_by!(email: 'guest_client@example.com') do |client|
      client.name = "ゲスト顧客"
      client.password = SecureRandom.urlsafe_base64
      client.telephone_number = "02699990909"
    end
  end

end
