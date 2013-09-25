FactoryGirl.define do
  factory :user do
    login "login"
    sequence(:email) { |i| "email#{i}@email.com" }
    password "password"
  end
end
