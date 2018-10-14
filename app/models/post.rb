class Post < ApplicationRecord
  after_save :set_to_redis
  validates :title, presence: true
  validates :body, length: { minimum: 2 }, allow_blank: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :community
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader

  acts_as_votable

  default_scope { order(created_at: :desc) }
  scope :user_subscribes_posts, -> ( user_id ) { joins( community: :subscribes ).where( user_id: user_id ) }
  scope :posts_user, -> ( user ) { joins( :user ).where( "users.nick like ?", "%#{user}%" ) if user.present? }
  scope :posts_community, -> ( community ) { joins( :community ).where( "communities.name like ?", "%#{community}%" ) if community.present? }
  scope :most_liked, -> { joins(:acts_as_votable).order(cached_votes_total: :desc) }
  ##RODO WRITED MOST POPULAR POST

  def set_to_redis
    $redis.mapped_hmset( redis_key, self.attributes )
  end

  def self.search(params)
    self.posts_user(params[:search_text]).posts_community(params[:search_text])
  end

  private

  def redis_key
    "#{self.class}:#{self.id}"
  end
end
