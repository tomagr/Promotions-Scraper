# == Schema Information
#
# Table name: subscriber_filters
#
#  id            :bigint           not null, primary key
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subscriber_id :bigint           not null
#
# Indexes
#
#  index_subscriber_filters_on_subscriber_id  (subscriber_id)
#

class SubscriberFilter < ApplicationRecord

	belongs_to :subscriber
	validates :name, uniqueness: { scope: :subscriber }, presence: true, length: { maximum: 255 }

	before_save :downcase_fields

	def downcase_fields
		self.name.downcase!
	end

end
