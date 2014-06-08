FactoryGirl.define do
	factory :vote do
		score { [1,-1].sample }
	end
end