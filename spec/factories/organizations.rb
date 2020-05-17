FactoryBot.define do
	factory :organization do
		sequence :name do |n|
			"Fake #{n}"
		end
		email {'example@test.com'}
		phone {'111-111-1111'}
		description{'a test organization'}
		primary_name {'primary name'}
		secondary_name {'secondary name'}
		secondary_phone {'222-222-2222'}
		status {:approved}

		trait :approved do
			status {0}
		end

		trait :rejected do
			status {2}
		end

		trait :locked do 
			status {3}
		end
	end
end