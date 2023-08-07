class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}

  validate :check_if_clickbait

    CLICKBAIT_TITLES = [
      # REGEX

      # Regex statements are in between the / characters
      # The i at the end means ignore case, or case-insensitive
      # \d means digit, so any digit from 1-9

      /Won't Believe/i,
      /Secret/i,
      /Top \d/i,
      /Guess/i
    ]

  def check_if_clickbait
    if CLICKBAIT_TITLES.none? { |pattern| pattern =~ title }
      errors.add(:title, "must be clickbait")
    end
  end

end
