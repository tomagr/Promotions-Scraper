FactoryBot.define do

	factory :subscribers do

		sequence(:email) { |n| "subscriber#{n}@amalgama.co" }
		
		factory :subscriber_without_email do
			email { nil }
		end

		factory :subscriber_without_name do
			first_name { nil }
		end

	end

end