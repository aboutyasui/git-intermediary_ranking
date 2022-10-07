class Comment < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :post
end
