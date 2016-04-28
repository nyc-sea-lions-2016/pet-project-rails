require 'rails_helper'

describe UsersController do

  let!(:sample_user) {sample_user = create(:user)}
  let!(:sample_pet1) {sample_pet1 = create(:pet)}
  let!(:sample_pet2) {sample_pet2 = create(:pet)}
  let!(:favorite1) {favorite1 = create(:favorite, pet_id: sample_pet1.id, user_id: sample_user.id)}
  let!(:favorite2) {favorite2 = create(:favorite, pet_id: sample_pet2.id, user_id: sample_user.id)}

  before do
    allow_any_instance_of(UsersController).to receive(:current_user).and_return(sample_user)
  end

  describe "GET #show" do
    it 'assigns current users pets as @pets' do
      pets_array = [sample_pet1, sample_pet2]
      get :show, id: sample_user.id, format: :json
      expect(assigns(:pets)).to eq(pets_array)
    end
  end

  describe "GET #edit" do
    it 'assigns current user as @user' do
      get :edit, id: sample_user.id, format: :json
      expect(assigns(:user)).to eq(sample_user)
    end
  end

end
