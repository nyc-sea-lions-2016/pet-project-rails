json.array! @pets do |potential_pet|
  json.extract! potential_pet[:pet], :id, :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs

  json.photos(potential_pet[:photos]) do |photo|
    json.url photo.url
  end
end
