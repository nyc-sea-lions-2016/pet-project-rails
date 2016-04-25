json.pet do

  json.extract! @potential_pet, :id, :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs

  json.photos(@photos) do |photo|
    json.url photo.url
  end

end
