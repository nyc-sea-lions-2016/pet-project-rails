require 'rails_helper'

RSpec.describe Pet, type: :model do

  it 'exists' do
    expect(Pet.new).to be_a Pet
  end

end
