FactoryGirl.define do

  ANIMALS = ['cat', 'dog', 'reptile', 'smallfurry', '']

  factory :user do
    name {Faker::Name.name}
    preferred_location {Faker::Address.zip_code}
    animal_preference {ANIMALS.sample}
    facebook_id {Faker::Number.number(10)}
  end

  factory :pet do

  end

  factory :favorite do

  end

  factory :photo do

  end

  factory :shelter do

  end

end
