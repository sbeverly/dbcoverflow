# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do Question.create(body: Faker::Lorem.sentence)
	(4..10).to_a.sample.times { Answer.create(question_id: (1..20).to_a.sample, body: Faker::Lorem.sentence)}
end

