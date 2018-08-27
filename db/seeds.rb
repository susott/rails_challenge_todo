# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(username:"first_expert",
                 password:"123456",
                 email:"expert@test.com",
                 expert: true,
                 status: "qualified",
                 profession: "Web-Dev",
                 service: "rails")
admin.save

beginner = User.new(username:"first_beginner",
                 password:"123456",
                 email:"beginner@test.com",
                 expert: true,
                 status: "not_qualified",
                 profession: "Web-Dev",
                 service: "coffee")
beginner.save
