FactoryBot.define do

	factory :user do
		email
		password {"fake password"}

		trait :admin do
			role {'admin'}
		end
	end
end
