class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post[:title].include?("Won't Believe"||"Secret"||"Top"||"Guess")
      post.errors[:title] << ''
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :clickbaity

  CLICKBAIT = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
  ]

  def clickbaity
    if CLICKBAIT.none? { |pat| pat.match title }
      errors.add(:title, "Need a clickbait title!")
    end
  end
end
