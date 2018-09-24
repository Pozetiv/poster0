class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :images

  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end