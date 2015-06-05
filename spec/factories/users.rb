FactoryGirl.define do
  factory :user do
    sequence(:username, 'a') { |i| "Tom#{i}" }
    email { username.downcase + '@example.com' }
    password 'password123'
    password_confirmation 'password123'
  end

end