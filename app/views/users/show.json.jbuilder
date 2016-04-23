json.array!@user.pets do |pet|
  json.id pet.id
  json.name pet.name
  json.animal pet.animal
  json.description pet.description
  json.age pet.age
  json.size pet.size
  json.gender pet.gender
  json.breed pet.breed
  json.altered pet.altered
  json.shots pet.shots
  json.special_needs pet.special_needs
  json.contact_city pet.contact_city
  json.contact_zip pet.contact_zip
  json.contact_state pet.contact_state
  json.contact_name pet.contact_name
  json.contact_email pet.contact_email
  json.contact_phone pet.contact_phone
end

json.array!@photos.photos do |photo|
  json.url photo.url
  json.pet_id photo.pet_id
end
# users/show.json
