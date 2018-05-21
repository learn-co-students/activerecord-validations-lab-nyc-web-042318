


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :better_title

    def better_title
      if(title == nil)
        errors.add(:title, "is empty.")
      elsif !title.include?("Won't Believe")
        errors.add(:title, "is not good enough")
      else
      end
    end
end
