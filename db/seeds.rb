# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Примерный",
    email: "example@railstutorial.org",
    password:              "123456",
    password_confirmation: "123456")

User.create!(
    name: "Андрей",
    email: "ahdpeu566@mail.ru",
    password: "q1o0o0q1h6",
    password_confirmation: "q1o0o0q1h6"
)

User.create!(
    name: "Игорь",
    email: "igor@mail.ru",
    password: "123456",
    password_confirmation: "123456"
)

User.create!(
    name: "Павел",
    email: "pavel@mail.ru",
    password: "123456",
    password_confirmation: "123456"
)

users = User.order(:created_at).take(3)

tag = Tag.create(name: "CSGO")
tag = Tag.create(name: "Dota")
tag = Tag.create(name: "Просьбы")
tag = Tag.create(name: "Такси")

for i in 0..5
    content = "Пост номер #{i}"
    users.each do |user|
        m = user.microposts.create!(content: content )
        m.tags<<(tag)
    end
end

for i in 0..5
    content = "Новость номер #{i}"
    users.each { |user| user.news_items.create!(content: content) }
end

puts "Seeded"