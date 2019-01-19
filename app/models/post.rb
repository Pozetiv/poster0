class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { minimum: 2 }, allow_blank: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :community
  has_many :comments, as: :commentable, dependent: :destroy

  mount_uploader :image, ImageUploader

  acts_as_votable

  include FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  default_scope { order(created_at: :desc) }
  scope :user_subscribes_posts, -> (user_id) { joins(community: :subscribes).where(user_id: user_id) }
  scope :posts_user, -> (user) { joins(:user).where("users.nick like ?", "%#{user}%") }
  scope :posts_community, -> (community) { joins(:community).where( "communities.name like ?", "%#{community}%") }
  scope :most_liked, -> { reorder(cached_weighted_average: :desc).limit(25) }
  scope :most_popular, -> { reorder(cached_votes_total: :desc ).limit(25) }
  scope :trend_day, -> do most_liked.where("created_at >= :begin_day and created_at <= :finish_day", 
    { begin_day: DateTime.now.utc.beginning_of_day, finish_day: DateTime.now.utc.end_of_day })
  end
  scope :trend_month, -> do most_liked.where("created_at >= :begin_month and created_at <= :finish_month",
    { begin_month: DateTime.now.utc.beginning_of_month.months_since(-1),
      finish_month: DateTime.now.utc.end_of_month.months_since(-1) })
  end
  scope :post_by_category, -> (category) { joins(:community).where("communities.category like ?", "%#{category}%") if category.present? }

  self.per_page = 30

  def self.search(params)
    params.rstrip!
    self.posts_user(params).union(posts_community(params))
  end
end
