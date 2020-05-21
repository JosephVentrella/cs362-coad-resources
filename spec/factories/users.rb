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
		#trait :validate do
		#	validate = true
		#end
	end
end
