class SubscriberWish < ApplicationRecord
	belongs_to :subscriber
	validates :name, uniqueness: { scope: :subscriber }, presence: true, length: { maximum: 255 }

	before_save :downcase_fields

	def downcase_fields
		self.name.downcase!
	end

end
