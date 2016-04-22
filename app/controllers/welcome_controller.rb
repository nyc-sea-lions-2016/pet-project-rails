class WelcomeController < ApplicationController

  # API REQUEST CONSTANTS
  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'

  def index
    potential_pet = pet_finder_request
    status_code = potential_pet["petfinder"]["header"]["status"]["code"]["$t"]

    if status_code == "100"
      binding.pry
      # expect something to be passed through no matter what. set up or statements to handle this
      petfinder_id =
      name =
      animal =
      description =
      age =
      size =
      gender =
      breed =
      photos =
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
