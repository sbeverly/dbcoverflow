FactoryGirl.define do
	factory :user do
		username { Faker::Internet.user_name }
		email { Faker::Internet.email }
		password_hash { "password" }
	end

	factory :question do
		body { Faker::Lorem.sentence }
	end

	factory :answer do
		body { Faker::Name.name }
	end

	factory :comment do
		body { Faker::Lorem.paragraph }
	end


	factory :vote do
		score { Faker::Number.digit }
	end

end