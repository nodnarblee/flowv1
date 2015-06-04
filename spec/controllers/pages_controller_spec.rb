require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end
  end

  describe "GET favourites" do

    let(:user) { FactoryGirl.create(:user) }

    before do
      user.confirm!
      sign_in user
    end

    it "returns http success" do
      get :favourites
      expect(response).to be_success
    end

  end

  describe "GET favourites without sign-in" do

    it "redirects to sign in path" do
      get :favourites
      expect(response).to redirect_to(new_user_session_path)
    end

  end



end