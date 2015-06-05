require 'rails_helper'

feature "User Login" do

  let!(:user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
  end

  scenario "User logs in successfully", js: true do
    visit '/'
    #click sign in
    page.find('#wrap > header > nav > div > div.collapse.navbar-collapse > ul > li:nth-child(2) > a').click
    fill_in "user_username", with: "#{user.username}"
    fill_in "user_password", with: "#{user.password}"
    #click submit
    page.find('#new_user > div.row > div > input').click
    # expect to see the following text on redirect to 'Favourites'
    expect(page).to have_text("Oops! You don't seem to have any favourited articles...")
  end

  scenario "User logs in unsuccessfully", js: true do
    visit '/'
    #click sign in
    page.find('#wrap > header > nav > div > div.collapse.navbar-collapse > ul > li:nth-child(2) > a').click
    fill_in "user_username", with: "#{user.username}"
    fill_in "user_password", with: "wrong password"
    #click submit
    page.find('#new_user > div.row > div > input').click
    # expect to see the following text on unsuccessful login
    expect(page).to have_text("Invalid username or password.")
  end

end