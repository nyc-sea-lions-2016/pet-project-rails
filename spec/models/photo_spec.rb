require 'rails_helper'

RSpec.describe Photo, type: :model do

  it 'exists' do
    expect(Photo.new).to be_a Photo
  end

end
