class Review < ApplicationRecord
  belongs_to :client
  belongs_to :trader

  # 星の評価の空を禁止する、且つ1以上、5未満
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true

  ##検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("star LIKE?", "#{word}")
    elsif search == "forward_match"
      @review = Review.where("star LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("star LIKE?","%#{word}")
    elsif search == "partial_match"
      @review = Review.where("star LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

end
