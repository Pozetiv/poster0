class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { minimum: 2 }, allow_blank: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :community
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader
end
