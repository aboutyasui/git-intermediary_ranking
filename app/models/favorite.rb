class Favorite < ApplicationRecord
  belongs_to :post, optional: true 
  belongs_to :trader, optional: true
  #optional: trueを設定しておくと、外部キーがnilであってもDBに保存できます。
end
