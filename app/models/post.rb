class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  CLICKBAIT = [/Won't Believe/, /Secret/, /Top [number]/, /Guess/]

  def is_clickbait?
    if CLICKBAIT.none? { |text| text.match title}
      errors.add(:title, "It's clickbait!")
    end
  end
end
