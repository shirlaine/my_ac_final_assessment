# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding data for notes"

note1 = Note.find_or_create_by!(
  title: 'note 1',
  body: 'note 1 body',
  user_id: '1'
)

note3 = Note.find_or_create_by!(
  title: 'note 3',
  body: 'note 3 body',
  user_id: '1'
)

note2 = Note.find_or_create_by!(
  title: 'note 2',
  body: 'note 2 body',
  user_id: '2'
)

note4 = Note.find_or_create_by!(
  title: 'note 4',
  body: 'note 4 body',
  user_id: '2'
)

# user2 = User.find_or_initialize_by(email: "user2@gmail.com")
# user2.password = '123123'
# user2.save
