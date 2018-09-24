class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence:true

  belongs_to :user
  has_many :images
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader

end
