json.array!@shelters do |shelter|
  json.title shelter.name
  json.longitude shelter.longitude
  json.latitude shelter.latitude
end
