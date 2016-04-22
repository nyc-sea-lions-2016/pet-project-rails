class WelcomeController < ApplicationController

  # API REQUEST CONSTANTS
  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'
  # ANIMAL = 'cat'
  def index
    potential_pet = pet_finder_request
    status_code = potential_pet["petfinder"]["header"]["status"]["code"]["$t"]
    if status_code == "100"

      options = [potential_pet["petfinder"]["pet"]["options"]]
      # expect something to be passed through no matter what. set up or statements to handle this
      petfinder_id =  potential_pet["petfinder"]["pet"]["id"]["$t"]
      name = potential_pet["petfinder"]["pet"]["name"]["$t"]
      animal = potential_pet["petfinder"]["pet"]["animal"]['$t']
      description = potential_pet["petfinder"]["pet"]["description"]["$t"]
      age = potential_pet["petfinder"]["pet"]["age"]["$t"]
      size = potential_pet["petfinder"]["pet"]["size"]["$t"]
      gender = potential_pet["petfinder"]["pet"]["sex"]["$t"]
      breed = potential_pet["petfinder"]["pet"]["breeds"]["breed"]["$t"]


      altered =
      shots =
      special_needs =
      contact_city =
      contact_zip =
      contact_state =
      contact_name =
      contact_email =
      contact_phone =
      @potential_pet = Pet.new({})
      @photos = #pass in photo urls Photo.new({})
    else
      error_msg = potential_pet["petfinder"]["header"]["status"]["message"]
    end
  end

  private

  def pet_finder_request
    request_url = 'http://api.petfinder.com/pet.getRandom?key=' + KEY + '&location=' + DEFAULT_LOCATION + '&output=' + OUTPUT + '&format=' + FORMAT
    HTTParty.get(request_url)
  end

end
