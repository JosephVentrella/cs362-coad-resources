FactoryBot.define do

	factory :user do
		email
		password {"fake password"}

		trait :admin do
			role {'admin'}
		end
		trait :organization do
			role {'organization'}
		end
		after :create do |user|
			user.confirm
		end
	end
end
