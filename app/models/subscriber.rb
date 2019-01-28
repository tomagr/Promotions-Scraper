# == Schema Information
#
# Table name: subscribers
#
#  id         :bigint(8)        not null, primary key
#  email      :string(255)
#  available  :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)      not null
#
# Indexes
#
#  index_subscribers_on_email  (email)
#

class Subscriber < ApplicationRecord

	validates :email, presence: true,
		uniqueness: true, length: { maximum: 255 }

end
