require 'faker'

10.times { @user = User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: '123456', pa) }

@users = User.all

@users.each do |user|
	4.times do 
		@question = Question.create(user_id: user.id, body: Faker::Lorem.sentence)
		2.times { @question.answers << Answer.create(user_id: (1..10).to_a.sample, body: Faker::Lorem.sentence)}
	end
end

@questions = Question.all
@answers = Answer.all

@questions.each do |question|
	(2).times { Comment.create(user_id: (1..10).to_a.sample, commentable_type: 'Question', commentable_id: (1..@questions.count).to_a.sample, body: Faker::Lorem.sentence) }
end

@answers.each do |answer|
	(2).times { Comment.create(user_id: (1..10).to_a.sample, commentable_type: 'Answer', commentable_id: (1..@answers.count).to_a.sample, body: Faker::Lorem.sentence) }
end