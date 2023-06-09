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

FactoryBot.define do

	factory :subscriber do

		sequence(:email) { |n| "subscriber#{n}@amalgama.co" }
		sequence(:name) { |n| "A Subscriber #{n}" }

		factory :subscriber_without_email do
			email { nil }
		end

		factory :subscriber_with_empty_name do
			name { '' }
		end

	end

end
