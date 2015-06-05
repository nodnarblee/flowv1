require 'rails_helper'

feature "Delete Favourite" do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:article) { FactoryGirl.create(:article) }
  let!(:favourite) { FactoryGirl.create(:favourite, article_id: article.id, user_id: user.id) }

  before do
    user.confirm!
    login_as user
  end

  scenario "User favourites an article", js: true do
    visit '/'
    #click favourites
    page.find('#wrap > header > nav > div > div.collapse.navbar-collapse > ul > li:nth-child(2) > a').click
    expect(Article.count).to eq 1
    #click delete
    page.find('#wrap > div > div:nth-child(2) > div > div > div > div > table > tbody > tr > td:nth-child(6) > button').click
    sleep 2 # waiting for article to delete
    expect(Article.count).to eq 0
  end


end