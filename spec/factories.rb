APP_ANIMALS = ['cat', 'dog', 'reptile', 'smallfurry', '']
ALL_ANIMALS = ['barnyard', 'bird', 'cat', 'dog', 'horse', 'pig', 'reptile', 'smallfurry']
SIZE = ['S','M','L','XL']
GENDER = ['M','F']
TF = ['true','false']

FactoryGirl.define do

  factory :user do
    name {Faker::Name.name}
    preferred_location {Faker::Address.zip_code}
    animal_preference {APP_ANIMALS.sample}
    facebook_id {Faker::Number.number(10)}
  end

  factory :pet do
    petfinder_id {Faker::Number.number(5)}
    name {Faker::Name.first_name}
    animal {ALL_ANIMALS.sample}
    description {Faker::Lorem.paragraph}
    age {Faker::Number.between(0, 20)}
    size {SIZE.sample}
    gender {GENDER.sample}
    breed {Faker::Lorem.word}
    altered {TF.sample}
    shots {TF.sample}
    special_needs {Faker::Lorem.word}
    contact_city {Faker::Address.city}
    contact_zip {Faker::Address.zip_code}
    contact_state {Faker::Address.state}
    contact_address {Faker::Address.street_address}
    contact_email {Faker::Internet.safe_email}
    contact_phone {Faker::PhoneNumber.phone_number}
  end

  factory :favorite do
    user_id {1}
    pet_id {1}
  end

  factory :photo do
    pet_id {1}
    url {Faker::Internet.url}
  end

  factory :shelter do
    longitude {Faker::Number.decimal(2)}
    latitude {Faker::Number.decimal(2)}
    name {Faker::Company.name}
    email {Faker::Internet.safe_email}
    city {Faker::Address.city}
    zip_code {Faker::Address.zip_code}
    petfinder_id {Faker::Number.number(5)}
    phone {Faker::PhoneNumber.phone_number}
  end

end
