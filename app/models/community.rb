class Community < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :subscribes, dependent: :destroy
  has_many :posts
end
