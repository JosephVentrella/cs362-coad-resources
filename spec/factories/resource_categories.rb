FactoryBot.define do 
	factory :resource_category do
		sequence :name do |n|
			"Fake #{n}"
		end
		trait :unspecified do
			name{'Unspecified'}
		end
	end
end