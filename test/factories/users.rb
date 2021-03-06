FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user do
    email
    first_name "Test"
    last_name "User"
    password "password"
    password_confirmation "password"
  end
end