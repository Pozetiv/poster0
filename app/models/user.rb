class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :messages, -> { where(commentable_type: "Conversation") }, class_name: 'Comment'
  has_many :subscribes, dependent: :destroy
  has_many :communities, through: :subscribes
  has_many :created_communities, class_name: "Community"

  validates :nick, presence: true, uniqueness: true
  validates :karma, presence: true, numericality: { only_integer: true }

  mount_uploader :avatar, AvatarUploader

  acts_as_voter

  def online?
    $redis.exists(self.id)
  end

  def admin?
    self[:admin] == true
  end
end
