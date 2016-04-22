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
      binding.pry
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
