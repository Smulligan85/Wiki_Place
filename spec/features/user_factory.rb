FactoryGirl.define do
  factory :user do
    name "Test User 1"
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end