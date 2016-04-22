# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  name: "fj"
)

Pet.create!(
  petfinder_id: 1
  name: "alyssa",
  animal: "dog",
  description: "loving",
  age: 1,
  size: "small",
  gender: "female",
  breed: "german short-hair-pointer",
  altered: "spayed",
  shots: "no",
  special_needs: "n/a",
  contact_city: "NY",
  contact_state: "NY",
  contact_zip: "11111",
  contact_name: "FJ",
  contact_email: "fj@example.com",
  contact_phone: 1234567891
)

# Preference.create(
#   category: [
#     {
#     size: "S",
#     animal: "dog",
#     breed: "pitt",
#     sex: "F",
#     location: "New York"
#     }
#   ],
  
# )
