class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable

  validates :body, presence: true, format: { with: /\A[a-zA-Z0-9@!]+*\z/ }

  default_scope { order(created_at: :desc) }

  def self.replies(text, user)
    self.replies.create(body: text, user: user)
  end
end
##TODO VIES TO NESTED comments replies