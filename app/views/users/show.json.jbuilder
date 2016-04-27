json.array! @pets do |pet|
  json.extract! pet, :id, :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs, :contact_email, :contact_phone, :contact_address, :contact_city, :contact_state, :contact_zip

  json.photos(pet.photos) do |photo|
    json.url photo.url
  end
end
