class SheltersController < ApplicationController

  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'

  def index
    request_url = 'http://api.petfinder.com/shelter.find?key=' + KEY + '&location=' + DEFAULT_LOCATION + '&output=' + OUTPUT + '&format=' + FORMAT
    response = HTTParty.get(request_url)
    binding.pry
    response.each do |shelter|

  end

end
