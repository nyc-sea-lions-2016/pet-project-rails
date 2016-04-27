require 'rails_helper'

RSpec.describe User, type: :model do

  it 'exists' do
    expect(User.new).to be_a User
  end

  [:facebook_id].each do |attribute|
    it {is_expected.to validate_presence_of attribute}
  end

end
