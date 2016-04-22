class WelcomeController < ApplicationController

<<<<<<< HEAD
=======
  # API REQUEST CONSTANTS
  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'
  # ANIMAL = 'cat'
>>>>>>> master
  def index
    potential_pet = pet_finder_request
    status_code = potential_pet["petfinder"]["header"]["status"]["code"]["$t"]
    if status_code == "100"

      #BASIC INFO
      petfinder_id =  potential_pet["petfinder"]["pet"]["id"]["$t"]
      name = potential_pet["petfinder"]["pet"]["name"]["$t"]
      animal = potential_pet["petfinder"]["pet"]["animal"]['$t']
      description = potential_pet["petfinder"]["pet"]["description"]["$t"]
      age = potential_pet["petfinder"]["pet"]["age"]["$t"]
      size = potential_pet["petfinder"]["pet"]["size"]["$t"]
      gender = potential_pet["petfinder"]["pet"]["sex"]["$t"]
      breed = potential_pet["petfinder"]["pet"]["breeds"]["breed"]["$t"]

      #OPTIONS
      options = get_options(potential_pet["petfinder"]["pet"]["options"]["option"])
        altered = options.include?('altered')? true : false
        shots = options.include?('hasShots')? true : false
        special_needs = options.select{|option| option != 'altered' && option != 'hasShots'}.join(', ')

      #LOCATION
      contact_city = potential_pet["petfinder"]["pet"]["contact"]["city"]["$t"]
      contact_zip = potential_pet["petfinder"]["pet"]["contact"]["zip"]["$t"]
      contact_state = potential_pet["petfinder"]["pet"]["contact"]["state"]["$t"]
      contact_name = potential_pet["petfinder"]["pet"]["contact"]["name"]["$t"]
      contact_email = potential_pet["petfinder"]["pet"]["contact"]["email"]["$t"]
      contact_phone = potential_pet["petfinder"]["pet"]["contact"]["phone"]["$t"]

      #FIRST PHOTO
      photo_url = potential_pet["petfinder"]["pet"]["media"]["photos"]["photo"][0]['$t']

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
      @photo = Photo.new({photo_url: photo, pet_id: @potential_pet.id})

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
    if options_obj.length > 0
      options_obj.each do |option|
        options << option['$t']
      end
    end
    options
  end

end
