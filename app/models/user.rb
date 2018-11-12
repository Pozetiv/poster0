class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_many :posts
  has_many :comments, as: :commentable
  has_many :subscribes, dependent: :destroy
  has_many :communities, through: :subscribes
  has_many :created_communities, class_name: "Community"

  validates :nick, presence: true, uniqueness: true
  validates :karma, presence: true, numericality: { only_integer: true }

  after_save :set_to_redis

  mount_uploader :avatar, AvatarUploader

  acts_as_voter

  def online?
    $redis.exists(self.id)
  end

  def admin?
    self[:admin] == true
  end

  def get_from_redis(nick)
    $redis.get(nick)
  end

  private

  def set_to_redis
    $redis.set(self.nick, nil)
  end
end
