# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(user_name: 'Hank')
user2 = User.create(user_name: 'Bill')
user3 = User.create(user_name: 'Dale')
user4 = User.create(user_name: 'Boomhower')
user5 = User.create(user_name: 'Bobby')

Poll.destroy_all

poll1 = Poll.create(title: 'Propane Poll', author_id: user1.id)
poll2 = Poll.create(title: 'Gas Poll', author_id: user2.id)
poll3 = Poll.create(title: 'Burger Poll', author_id: user2.id)
poll4 = Poll.create(title: 'Texas Poll', author_id: user1.id)
poll5 = Poll.create(title: 'Lol Poll', author_id: user5.id)

Question.destroy_all

question1 = Question.create(text: 'How many days?', poll_id: poll1.id)
question2 = Question.create(text: 'How many jokes?', poll_id: poll3.id)
question3 = Question.create(text: 'How many lols?', poll_id: poll2.id)
question4 = Question.create(text: 'How many terp?', poll_id: poll4.id)
question5 = Question.create(text: 'How many propane?', poll_id: poll1.id)

AnswerChoice.destroy_all

answer_choices1 = AnswerChoice.create(text: 'Yes', question_id: question1.id)
answer_choices2 = AnswerChoice.create(text: 'No', question_id: question2.id)
answer_choices3 = AnswerChoice.create(text: 'Maybe', question_id: question1.id)
answer_choices4 = AnswerChoice.create(text: 'Likely', question_id: question2.id)
answer_choices5 = AnswerChoice.create(text: 'Definitely', question_id: question1.id)

Response.destroy_all

response1 = Response.create(answer_id: answer_choices1.id, user_id: user5.id)
response2 = Response.create(answer_id: answer_choices2.id, user_id: user1.id)
response3 = Response.create(answer_id: answer_choices3.id, user_id: user2.id)
response4 = Response.create(answer_id: answer_choices4.id, user_id: user1.id)
response5 = Response.create(answer_id: answer_choices5.id, user_id: user4.id)
