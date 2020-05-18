FactoryBot.define do
	factory :region do
		trait :unspecified do
			name {'Unspecified'}
		end
		sequence :name do |n|
			"Fake #{n}"
		end
	end
end