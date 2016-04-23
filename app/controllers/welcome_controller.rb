class WelcomeController < ApplicationController

  def index
    potential_pet = pet_finder_request
    status_code = potential_pet["petfinder"]["header"]["status"]["code"]["$t"]

    if status_code == "100"

      pet = potential_pet["petfinder"]["pet"]

      #BASIC INFO
      petfinder_id =  pet["id"]["$t"]
      name = pet.has_key?("name") ? pet["name"]["$t"] : ''
      animal = pet.has_key?("animal") ? pet["animal"]['$t'] : ''
      description = pet.has_key?("description") ? pet["description"]["$t"] : ''
      age = pet.has_key?("age") ? pet["age"]["$t"] : ''
      size = pet.has_key?("size") ? pet["size"]["$t"] : ''
      gender = pet.has_key?("sex") ? pet["sex"]["$t"] : ''

      if pet.has_key?("breeds")
        if pet["breeds"].has_key?("breed")
          if pet["breeds"]["breed"].is_a?(Array)
            breed = pet["breeds"]["breed"][0]["$t"]
          else
            breed = pet["breeds"]["breed"]["$t"]
          end
        else
          breed=''
        end
      else
        breed = ''
      end

      #OPTIONS
      options = get_options(pet["options"]["option"])
        altered = options.include?('altered')? true : false
        shots = options.include?('hasShots')? true : false
        special_needs = options.select{|option| option != 'altered' && option != 'hasShots'}.join(', ')

      #LOCATION
      pet_contact = pet["contact"]
        contact_city = pet_contact.has_key?("city") ? pet_contact["city"]["$t"] : ''
        contact_zip = pet_contact.has_key?("zip") ? pet_contact["zip"]["$t"] : ''
        contact_state = pet_contact.has_key?("state") ? pet_contact["state"]["$t"] : ''
        contact_name = pet_contact.has_key?("name") ? pet_contact["name"]["$t"] : ''
        contact_email = pet_contact.has_key?("email") ? pet_contact["email"]["$t"] : ''
        contact_phone = pet_contact.has_key?("phone") ? pet_contact["phone"]["$t"] : ''

      #FIRST PHOTO
      photo_url = pet.has_key?("media") && pet["media"].has_key?("photos") ? pet["media"]["photos"]["photo"][0]['$t'] : 'http://www.iconsdownload.net/icons/256/1588-paw-print-outline-icon.png'

      @potential_pet = Pet.new({
          petfinder_id: petfinder_id,
          name: name,
          animal: animal,
          description: description,
          age: age,
          size: size,
          gender: gender,
          breed: breed,
          altered: altered,
          shots: shots,
          special_needs: special_needs
        })
      @photo = Photo.new({url: photo_url, pet_id: @potential_pet.id})
    else
      error_msg = potential_pet["petfinder"]["header"]["status"]["message"]
    end

  end

  private

  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'

  def pet_finder_request
    request_url = 'http://api.petfinder.com/pet.getRandom?key=' + KEY + '&location=' + DEFAULT_LOCATION + '&output=' + OUTPUT + '&format=' + FORMAT
    HTTParty.get(request_url)
  end

  def get_options(options_obj)
    options = []
    p options_obj
    if options_obj && options_obj.length > 1
      options_obj.each do |option|
        p option
        options << option['$t']
      end
    elsif options_obj && options_obj.length == 1
      options << options_obj['$t']
    end
    options
  end

end
