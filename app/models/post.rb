class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { minimum: 2 }, allow_blank: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :community
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader

  acts_as_votable

  default_scope { order(created_at: :desc) }
  scope :user_subscribes_posts, -> (user_id) { joins(community: :subscribes).where(user_id: user_id) }
  ##RODO WRITED MOST POPULAR POST
end
