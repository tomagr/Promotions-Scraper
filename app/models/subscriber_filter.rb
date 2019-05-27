# == Schema Information
#
# Table name: subscriber_filters
#
#  id            :bigint(8)        not null, primary key
#  subscriber_id :bigint(8)        not null
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_subscriber_filters_on_subscriber_id  (subscriber_id)
#

class SubscriberFilter < ApplicationRecord

	belongs_to :subscriber
	validates :name, uniqueness: { scope: :subscriber }, presence: true

end
