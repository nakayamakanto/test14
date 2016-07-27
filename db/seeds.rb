# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do  |n|
  myemail=Faker::Internet.email
  mypassword="password"
  myname=Faker::Name.first_name
  myavatar=Faker::Avatar.image

  User.create!(
      email: myemail,
      name: myname,
      uid: SecureRandom.uuid,
      password: mypassword,
      password_confirmation: mypassword,
      avatar: myavatar
    )
end

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.png"))
end

100.times do |n|
  Picture.create!(
      title: Faker::Lorem.word,
      image: seed_image("cat1"), 
      content: Faker::Lorem.sentence,
      user_id: rand(9)+2
    )
end