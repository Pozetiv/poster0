FactoryBot.define do
  factory :post, class: Post do
    sequence(:title) { |n| "post title#{n}" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/image/image.jpeg'), 'image/jpeg') }
    association :user, factory: :user
    association :community, factory: :community
  end
end
