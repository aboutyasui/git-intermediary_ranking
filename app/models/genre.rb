class Genre < ApplicationRecord
  has_many :traders, dependent: :destroy
end
