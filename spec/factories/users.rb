# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence(:email) { |n| "user_#{n}@example.com" }
  sequence(:password, aliases: [:password_confirmation]) { |n| 'passwo_rd' }

  factory :user do
    email
    password
    password_confirmation
  end
end
