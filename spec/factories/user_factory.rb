FactoryGirl.define do
  factory :user do
    name "Test User 1"
    email "test1@example.com"
    password "password"
    password_confirmation "password"
  end
end