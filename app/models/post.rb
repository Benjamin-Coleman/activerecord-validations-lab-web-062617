class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :clickbait?

	def clickbait?
		if (/Won't Believe/).match(title) || (/Secret/).match(title) || (/Top [0-9]*/).match(title) || (/Guess/).match(title)
		else
			errors.add(:title, "Clickbait")
		end
	end
end
