json.array!@shelters do |shelter|
  json.name shelter.name
  json.longitude shelter.longitude
  json.latitude shelter.latitude
  json.phone shelter.phone
  json.email shelter.email
end
