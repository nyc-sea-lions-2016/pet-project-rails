class SheltersController < ApplicationController

  def index
    shelters_list = get_shelters_request

    @shelters = []
    shelters_list["petfinder"]["shelters"]["shelter"].each do |shelter|
      name = shelter["name"]["$t"]
      longitude = shelter["longitude"]["$t"].to_f
      latitude = shelter["latitude"]["$t"].to_f
      @shelters << Shelter.new({name: name, longitude: longitude, latitude: latitude})
    end
    @shelters
  end

  private

  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'

  def get_shelters_request
    request_url = 'http://api.petfinder.com/shelter.find?key=' + KEY + '&location=' + DEFAULT_LOCATION + '&output=' + OUTPUT + '&format=' + FORMAT
    HTTParty.get(request_url)
  end

end
