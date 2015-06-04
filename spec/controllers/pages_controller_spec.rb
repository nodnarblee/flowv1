require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
    end
  end

  describe "GET favourites" do
    it "returns http success" do
      get :favourites
      expect(response).to be_success
    end
  end

  describe "GET email" do
    it "returns http success" do
      get :email
      expect(response).to be_success
    end
  end


end