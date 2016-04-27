require 'rails_helper'

RSpec.describe Pet, type: :model do

  it 'exists' do
    expect(Pet.new).to be_a Pet
  end

  [:petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :contact_city, :contact_zip, :contact_state, :contact_address, :contact_email, :contact_phone].each do |attribute|
    it {is_expected.to validate_presence_of attribute}
  end

end
