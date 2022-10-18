class Favorite < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :client, optional: true
  #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。
  validates_uniqueness_of :post_id, scope: :client_id
end
