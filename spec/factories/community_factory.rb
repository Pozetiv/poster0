FactoryBot.define do
  CATEGORY_COMMUNITY = ['Technologies', 'Game', 'Jokes', 'Cars', 'For girls', 'For mans', 'Study']
  factory :community, class: Community do
    sequence(:name) { |n| "community_name#{n}" }
    category { CATEGORY_COMMUNITY.sample }
    association :owner, factory: :user
  end
end
