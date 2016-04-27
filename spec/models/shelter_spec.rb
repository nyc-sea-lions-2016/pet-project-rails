require 'rails_helper'

RSpec.describe Shelter, type: :model do

  it 'exists' do
    expect(Shelter.new).to be_a Shelter
  end

end
