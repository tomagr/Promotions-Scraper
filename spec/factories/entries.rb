# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  available   :boolean          default(FALSE)
#  email_sent  :boolean          default(FALSE)
#  featured    :boolean          default(FALSE)
#  released_at :datetime
#  status      :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  site_id     :integer
#

FactoryBot.define do

	factory :entry do

		sequence(:title) { |n| "Some entry" }
		# sequence(:site_id) { rand(20800..20900) }
		sequence(:site_id) { 20897 }

		factory :entry_without_site_id do
			site_id { nil }
		end

	end

end
