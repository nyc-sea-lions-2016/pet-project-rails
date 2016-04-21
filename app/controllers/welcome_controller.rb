class WelcomeController < ApplicationController

  def index
    location = '10005'
    key = ENV['PET_FINDER_KEY']
    request_url = 'http://api.petfinder.com/pet.getRandom?key=' + key + '&location=' + location + '&output=full&format=json'
    @potential_pet = HTTParty.get(request_url)
    binding.pry
  end

end
