FactoryGirl.define do
	factory :user do
		name { Faker::Name.name }
	end

	factory :question do
		text { Faker::Name.name }
	end

	factory :answer do
		text { Faker::Name.name }
	end

	factory :comment do
		text { Faker::Name.name }
	end

	factory :vote do
		name { Faker::Name.name }
	end

end