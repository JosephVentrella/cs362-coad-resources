FactoryBot.define do
	factory :ticket do
		sequence :name do |n|
			"Fake #{n}"
		end
		description {"FAKE"}
		phone {"14802580854"}
		region_id { create(:region).id }
		resource_category_id { create(:resource_category).id }

		trait :organization do
			organization
		end

		trait :id do
			id{:id}
		end

		trait :open_ticket do
			closed { false }
		end

		trait :closed_ticket do
			closed { true }
		end
	end
end