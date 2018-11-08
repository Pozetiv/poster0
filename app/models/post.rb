class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { minimum: 2 }, allow_blank: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :community
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader

  acts_as_votable

  include FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  default_scope { order(created_at: :desc) }
  scope :user_subscribes_posts, -> ( user_id ) { joins( community: :subscribes ).where( user_id: user_id ) }
  scope :posts_user, -> ( user ) { joins( :user ).where( "users.nick like ?", "%#{user}%" ) if user.present? }
  scope :posts_community, -> ( community ) { joins( :community ).where( "communities.name like ?", "%#{community}%" ) if community.present? }
  scope :most_liked, -> { joins(:acts_as_votable).order(cached_votes_total: :desc) }
  ##TODO WRITED MOST POPULAR POST

    def search(params)
      self.posts_user(params[:search_text]).posts_community(params[:search_text])
    end
end
