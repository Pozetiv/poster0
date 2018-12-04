class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  validates :body, presence: true

  default_scope { order(created_at: :desc) }
end
##TODO VIES TO NESTED comments replies