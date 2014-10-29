# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(email: Faker::Internet.email, name: Faker::Name.name)
end

5.times do
  match = Match.new
  User.all.sample(2).each do |user|
    match.users << user
  end
  match.save
end
