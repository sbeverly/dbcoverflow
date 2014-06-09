# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

10.times { @user = User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: '123456')}

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
