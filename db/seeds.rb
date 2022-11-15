# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "ava@ava.com", name: "ava", password: "123456")

user.photo.attach(
    io:  File.open(File.join(Rails.root,'app/assets/images/image.jpeg')),
    filename: 'image.jpeg'
)
