FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user#{n}@us.com" }
    sequence(:nick) { |n| "user#{n}" }
    password { 'password123' }
    password_confirmation { 'password123' }
    trait :admin do
      admin { true }
    end
  end
end