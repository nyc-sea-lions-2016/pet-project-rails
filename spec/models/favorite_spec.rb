require 'rails_helper'

RSpec.describe Favorite, type: :model do

  it 'exists' do
    expect(Favorite.new).to be_a Favorite
  end

end
