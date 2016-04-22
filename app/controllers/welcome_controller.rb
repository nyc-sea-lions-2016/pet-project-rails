class WelcomeController < ApplicationController

  def index
    potential_pet = pet_finder_request
    status_code = potential_pet["petfinder"]["header"]["status"]["code"]["$t"]

    if status_code == "100"
      binding.pry

      options_obj = potential_pet["petfinder"]["pet"]["options"]["option"]
      options = []
      if options_obj.length > 0
        options_obj.each do |option|
          options << option['$t']
        end
      end

      # expect something to be passed through no matter what. set up or statements to handle this
      petfinder_id =  potential_pet["petfinder"]["pet"]["id"]["$t"]
      name = potential_pet["petfinder"]["pet"]["name"]["$t"]
      animal = potential_pet["petfinder"]["pet"]["animal"]['$t']
      description = potential_pet["petfinder"]["pet"]["description"]["$t"]
      age = potential_pet["petfinder"]["pet"]["age"]["$t"]
      size = potential_pet["petfinder"]["pet"]["size"]["$t"]
      gender = potential_pet["petfinder"]["pet"]["sex"]["$t"]
      breed = potential_pet["petfinder"]["pet"]["breeds"]["breed"]["$t"]


      altered = true if options.include?('altered')
      shots = true if options.include?('hasShots')
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

  # API REQUEST CONSTANTS

  KEY = ENV['PET_FINDER_KEY']
  DEFAULT_LOCATION = '10005'
  OUTPUT = 'full'
  FORMAT = 'json'

  def pet_finder_request
    request_url = 'http://api.petfinder.com/pet.getRandom?key=' + KEY + '&location=' + DEFAULT_LOCATION + '&output=' + OUTPUT + '&format=' + FORMAT
    HTTParty.get(request_url)
  end

end
