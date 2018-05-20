class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, :length => { :minimum => 250 }
  validates :summary, :length => { :maximum => 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :clickbait?

  def clickbait?
    # title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess"
    # then return false
    titles = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
    if titles.none? {|i| i.match title}
      errors.add(:title, "must be clickbait")
    end
  end
end
