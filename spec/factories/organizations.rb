FactoryBot.define do
	factory :organization do
		sequence :name do |n|
			"Fake #{n}"
		end
		sequence :email do |n|
			"#{n}FAKE@fake.com"
		end
		phone {'111-111-1111'}
		primary_name {'primary name'}
		secondary_name {'secondary name'}
		secondary_phone {'222-222-2222'}
		status {:approved}

		trait :approved do
			status {:approved}
		end

		trait :rejected do
			status {:rejected}
		end

		trait :locked do 
			status {:locked}
		end
	end
end