require 'faker'

25.times do
  User.create(snake_name: Faker::Internet.user_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: Faker::Internet.password(6), email: Faker::Internet.email)
end

500.times do
  Hiss.create(user_id: rand(1..25), hiss: Faker::Hacker.say_something_smart)
end

500.times do
  Relationship.create(follower_id: rand(1..25), followed_id: rand(1..25))
end

