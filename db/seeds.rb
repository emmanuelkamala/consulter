# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({"email": "pascal@example.com",
                     "username": "pascal",
                     "password": "country",
                     "admin": "true",
                     "confirm": "true"
                    })

user2 = User.create({"email": "angelina@example.com",
                    "username": "angelina",
                    "password": "mycountry"
                   })

consultant1 = Consultant.create({"first_name": "Ludovick",
                                 "last_name": "Massawe",
                                 "email": "ludovick@example.com",
                                 "password": "ourcountry",
                                 "profession": "Doctor",
                                 "confirm": "true"
                                })

consultant2 = Consultant.create({"first_name": "Frank",
                                "last_name": "Felix",
                                "email": "frank@example.com",
                                "password": "thiscountry",
                                "profession": "Engineer"
                               })