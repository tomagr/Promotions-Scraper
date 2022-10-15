# == Schema Information
#
# Table name: subscribers
#
#  id         :bigint           not null, primary key
#  available  :boolean          default(TRUE), not null
#  email      :string(255)
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_subscribers_on_email  (email)
#

class Subscriber < ApplicationRecord

	has_many :filters, foreign_key: "subscriber_id", class_name: "SubscriberFilter", dependent: :destroy
	has_many :wishes, foreign_key: "subscriber_id", class_name: "SubscriberWish", dependent: :destroy

	accepts_nested_attributes_for :filters, :wishes, allow_destroy: true

	validates :email, presence: true,
						uniqueness: true, length: { maximum: 255 }

	scope :available, -> {
		where('available = true')
	}

end
