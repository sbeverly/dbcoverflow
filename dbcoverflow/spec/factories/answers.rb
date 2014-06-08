FactoryGirl.define do
	factory :answer do
		body { Faker::Name.name }
	end
end