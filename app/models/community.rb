class Community < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 15}

  has_many :subscribes, dependent: :destroy
  has_many :posts
  has_many :rules, inverse_of: :community, dependent: :destroy
  has_many :community_administrations, class_name: 'Community::Administration',dependent: :destroy

  accepts_nested_attributes_for :rules, reject_if: :all_blank, allow_destroy: true

  scope :popular_communities, -> { left_outer_joins(:subscribes).group('communities.id').order('COUNT(subscribes.community_id) DESC') }
  scope :popular_communities_mini, -> { popular_communities.limit(5) }

  mount_uploader :image, CommunityUploader

  def administion?(user)
  end
end
