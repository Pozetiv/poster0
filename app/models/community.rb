class Community < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  CATEGORY_COMMUNITY = ['Technologies', 'Game', 'Jokes', 'Cars', 'For girls', 'For mans', 'Study']

  validates :category, presence: true, inclusion: { in: CATEGORY_COMMUNITY }
  validates :name, presence: true, uniqueness: true, length: { in: 2..25 }

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :subscribes, dependent: :destroy
  has_many :users, through: :subscribes
  has_many :posts, dependent: :destroy
  has_many :rules, inverse_of: :community, dependent: :destroy
  has_many :community_administrations, class_name: 'Community::Administration',dependent: :destroy

  accepts_nested_attributes_for :rules, reject_if: :all_blank, allow_destroy: true

  scope :popular_communities, -> { left_outer_joins(:subscribes).group('communities.id').order('COUNT(subscribes.community_id) DESC') }
  scope :popular_communities_mini, -> { popular_communities.limit(5) }
  

  after_save :subscribe_owner

  mount_uploader :image, CommunityUploader

  def administrator?(user)
    self.community_administrations.find_by(user_id: user) ? true : false
  end

  def owner?(user)
    self.owner == user
  end

  def add_administrations(user)
    self.community_administrations.create(user_id: user)
  end

  private
  
  def subscribe_owner
    self.subscribes.create(user: self.owner )
  end
end
