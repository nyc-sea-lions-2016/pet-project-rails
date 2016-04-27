require 'rails_helper'

RSpec.describe Photo, type: :model do

  it 'exists' do
    expect(Photo.new).to be_a Photo
  end

  [:pet_id, :url].each do |attribute|
    it {is_expected.to validate_presence_of attribute}
  end

end
