# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding data for 5 Users"

user1 = User.find_or_initialize_by(username: 'User 1', email: "user1@gmail.com")
user1.password = '123123'
user1.save

user2 = User.find_or_initialize_by(username: 'User 2', email: "user2@gmail.com")
user2.password = '123123'
user2.save

user3 = User.find_or_initialize_by(username: 'User 3', email: "user3@gmail.com")
user3.password = '123123'
user3.save

user4 = User.find_or_initialize_by(username: 'User 4', email: "user4@gmail.com")
user4.password = '123123'
user4.save

user5 = User.find_or_initialize_by(username: 'User 5', email: "user5@gmail.com")
user5.password = '123123'
user5.save

puts "Seeding data for Notes"

5.times do
  Note.find_or_create_by!(
    title: Faker::Book.title,
    body: Faker::HowIMetYourMother.quote,
    user_id: 1
)
end

5.times do
Note.find_or_create_by!(
  title: Faker::Book.title,
  body: Faker::StarWars.wookiee_sentence,
  user_id: 2
)
end

5.times do
  Note.find_or_create_by!(
    title: Faker::Book.title,
    body: Faker::TheFreshPrinceOfBelAir.quote,
    user_id: 3
)
end

5.times do
  Note.find_or_create_by!(
    title: Faker::Book.title,
    body: Faker::ChuckNorris.fact,
    user_id: 4
)
end

5.times do
  Note.find_or_create_by!(
    title: Faker::Book.title,
    body: Faker::Coffee.notes,
    user_id: 5
  )
end

# user6 = User.find_or_create_by!(
#   username: 'note 2',
#   email: 'note 2 body',
#   password: '2'
# )








