require 'rails_helper'

feature "Favourites" do

  let!(:user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
    login_as user
  end

  scenario "User favourites an article", js: true do
    visit '/'
    page.find('#myCarousel > div > div.active.item > div:nth-child(1) > div > div > blockquote:nth-child(1) > button').click
    sleep 2 # waiting for record to persist
    expect(Article.count).to eq 1
  end


end