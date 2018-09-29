class Community < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :subscribes, dependent: :destroy
  has_many :posts

  scope :popular_communities, -> { left_outer_joins(:subscribes).group('communities.id').order('COUNT(subscribes.community_id) DESC') }

  mount_uploader :image, CommunityUploader
end
