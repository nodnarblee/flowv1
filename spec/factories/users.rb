FactoryGirl.define do
  factory :user do
    username 'bobby'
    email { username.downcase + '@example.com' }
    password 'password123'
    password_confirmation 'password123'
  end
end