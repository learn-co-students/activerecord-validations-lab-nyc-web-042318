class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_this_clickbait?

  @@clickbaity_things = [ /Won't Believe/, /Secret/, /Top [0-9]/, /Guess/ ]

  def is_this_clickbait?
    if @@clickbaity_things.none? { |text| text.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
