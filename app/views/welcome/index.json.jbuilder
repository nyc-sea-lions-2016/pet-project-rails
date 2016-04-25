json.array! @pets do |potential_pet|
  json.extract! potential_pet[:pet], :id, :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs, :contact_email, :contact_phone, :contact_address, :contact_city, :contact_state, :contact_zip

  json.photos(potential_pet[:photos]) do |photo|
    json.url photo.url
  end
end
