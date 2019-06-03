FactoryBot.define do

	factory :user do

		sequence(:email) { |n| "user#{n}@amalgama.co" }

		factory :user_without_email do
			email { nil }
		end

		factory :user_without_name do
			first_name { nil }
		end

	end

end
