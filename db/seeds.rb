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

tag = Tag.create(name: "Игры")
tag = Tag.create(name: "Просьбы")
tag = Tag.create(name: "Такси")
tag = Tag.create(name: "Магазин")
tag = Tag.create(name: "Товары")
tag = Tag.create(name: "Школа")
tag = Tag.create(name: "Наука")

for i in 0..1
    users.each do |user|
        content = "The flex container. ... The Flexible Box Module, usually referred to as flexbox, was designed as a one-dimensional layout model, and as a method that could offer space distribution between items in an interface and powerful alignment capabilities. ... This can be contrasted with the two ..." 
        x = Random.rand(0..2)
        if x == 0
            content = "Некоторый контент короткий"
        elsif x == 1 
            content = "Контент чуть чуть подлиньше чем короткий. Контент чуть чуть подлиньше чем короткий.Контент чуть чуть подлиньше чем короткий"
        end
        m = user.microposts.create!(content: content )
        m.tags<<(tag)
    end
end

for i in 0..5
    for user in users
        content = "The flex container. ... The Flexible Box Module, usually referred to as flexbox, was designed as a one-dimensional layout model, and as a method that could offer space distribution between items in an interface and powerful alignment capabilities. ... This can be contrasted with the two ..." 
        title = "Средний тиииииииииииииииитттульнииииииик"
        x = Random.rand(0..2)
        if x == 0
            title = "Супер дллллллиииииииииииииииииииииииинннннннннныйййй титульник"
            content = "Некоторый контент короткий"
        elsif x == 1 
            title = "Стандартный титульник"
            content = "Контент чуть чуть подлиньше чем короткий. Контент чуть чуть подлиньше чем короткий.Контент чуть чуть подлиньше чем короткий"
        end
        user.news_items.create!(title: title, content: content)
    end
end

puts "Seeded"