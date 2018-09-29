class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, as: :commentable
  has_many :subscribes, dependent: :destroy
  has_many :communities, through: :subscribes

  validates :nick, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader
end
