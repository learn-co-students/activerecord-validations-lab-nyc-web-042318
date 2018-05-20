class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 20 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :non_clickbait

  def non_clickbait
    titles = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]

    if titles.none? {|x| x.match title}
      errors.add(:title, "must be clickbait")
    end
  end

end
