class Community < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 15}

  has_many :subscribes, dependent: :destroy
  has_many :posts

  scope :popular_communities, -> { left_outer_joins(:subscribes).group('communities.id').order('COUNT(subscribes.community_id) DESC').limit(5) }

  mount_uploader :image, CommunityUploader
end
