class Review < ApplicationRecord
  ##アソシエーション
  belongs_to :client
  belongs_to :trader
end
