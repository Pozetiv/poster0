FactoryBot.define do
  factory :community, class: Community do
    sequence(:name) { |n| "community_name#{n}" }
    category { 'Game' }
    association :owner, factory: :user
  end
end
