User.create!(
  name: "fj"
)

Pet.create!(
  petfinder_id: 1,
  name: "alyssa",
  animal: "dog",
  description: "loving",
  age: '1',
  size: "small",
  gender: "female",
  breed: "german short-hair-pointer",
  altered: true,
  shots: false,
  special_needs: "n/a",
  contact_city: "NY",
  contact_state: "NY",
  contact_zip: "11111",
  contact_name: "FJ",
  contact_email: "fj@example.com",
  contact_phone: '1234567891',
)


categories = ["size","animal", "breed", "sex"]
preference_desc = [["S", "M", "L"], ["dog", "cat"], ["Affenpinscher", "American Curl", "Afghan Hound", "Abyssinian"], ["M", "F"]]


categories.each_with_index do |category, index|
  Preference.create!({category: category, preference_desc: preference_desc[index].sample})
end
