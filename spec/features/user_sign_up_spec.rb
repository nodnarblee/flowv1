require 'rails_helper'

feature "User Sign Up" do

  scenario "User Signs up successfully", js: true do
    visit '/'
    #click sign in
    page.find('#wrap > header > nav > div > div.collapse.navbar-collapse > ul > li:nth-child(3) > a').click
    fill_in "user_username", with: "Tester"
    fill_in "user_email", with: "Test@email.com"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    #click submit
    page.find('#new_user > div.row > div > input').click
    # expect to see the following text on redirect to 'Home'
    expect(page).to have_text("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end

end