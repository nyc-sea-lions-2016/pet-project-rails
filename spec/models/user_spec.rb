require 'rails_helper'

RSpec.describe User, type: :model do

  it 'exists' do
    expect(User.new).to be_a User
  end

end
