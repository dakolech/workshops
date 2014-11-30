# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(firstname:  "Daniel",
             lastname: "Koza",
             email: "danielkoza@gmail.com",
             password:              "danielkoza",
             password_confirmation: "danielkoza")

User.create!(firstname:  "John",
             lastname: "Lennon",
             email: "johnlennon@gmail.com",
             password:              "johnlennon",
             password_confirmation: "johnlennon")

User.create!(firstname:  "Ronnie",
             lastname: "O'Sullivan",
             email: "ronnieosullivan@gmail.com",
             password:              "ronnieosullivan",
             password_confirmation: "ronnieosullivan")

User.create!(firstname:  "Judd",
             lastname: "Trump",
             email: "judddtrump@gmail.com",
             password:              "juddtrump",
             password_confirmation: "juddtrump")

User.create!(firstname:  "Mark",
             lastname: "Selby",
             email: "markselby@gmail.com",
             password:              "markselby",
             password_confirmation: "markselby")

User.create!(firstname:  "Stephen",
             lastname: "Hendry",
             email: "stephenhendry@gmail.com",
             password:              "stephenhendry",
             password_confirmation: "stephenhendry")

users = User.all
users[0].update_column :admin, true

tables = Category.create!(name: "Tables")

(1..10).each do |i|
  tables.products.create!(title: "Table #{i}",
                          description: "Table #{i} is a good snooker table." + Faker::Lorem.sentence(Random.rand(10)),
                          price: i*1000.9,
                          user_id: users[Random.rand(5)].id)
end

cues = Category.create!(name: "Cues")

(1..10).each do |i|
  cues.products.create!(title: "Cue #{i}",
                        description: "Cue #{i} is a best cue for playing snooker." + Faker::Lorem.sentence(Random.rand(10)),
                        price: i*120.0,
                        user_id: users[Random.rand(5)].id)
end

accessories = Category.create!(name: "Accessories")

accessories.products.create!(title: "Table Brush",
                             description: "Table Brush is a brush for cleaning snooker tables." + Faker::Lorem.sentence(Random.rand(10)),
                             price: 22.59,
                             user_id: users[0].id)

accessories.products.create!(title: "Marking Board",
                             description: "Marking Board is a boeard for saving score." + Faker::Lorem.sentence(Random.rand(10)),
                             price: 69.9,
                             user_id: users[1].id)

accessories.products.create!(title: "Pro Cue Tip",
                             description: "Pro Cue Tip is a tip for snooker cue." + Faker::Lorem.sentence(Random.rand(10)),
                             price: 12.5,
                             user_id: users[2].id)

products = Product.all

products.each do |product|
  5.times do
    product.reviews.create!(content: Faker::Lorem.sentence(Random.rand(10)),
                            rating: Random.rand(5),
                            user_id: users[Random.rand(5)].id)
  end

end


