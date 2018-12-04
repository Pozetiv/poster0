class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, as: :commentable
  has_many :subscribes, dependent: :destroy
  has_many :communities, through: :subscribes
  has_many :created_communities, class_name: "Community"
  has_one  :mail_box, dependent: :destroy

  validates :nick, presence: true, uniqueness: true
  validates :karma, presence: true, numericality: { only_integer: true }

  after_save :set_to_redis
  after_create :create_mail_box

  mount_uploader :avatar, AvatarUploader

  acts_as_voter

  def online?
    $redis.exists(self.id)
  end

  def admin?
    self[:admin] == true
  end

  def self.get_from_redis(nick)
    $redis.get(nick)
  end

  private

  def set_to_redis
    $redis.set(self.nick, nil)
  end

  def create_mail_box
    user_box = self.build_mail_box
    user_box.save
  end
end

