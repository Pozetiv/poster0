class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable, class_name: 'Comment'

  validates :body, presence: true

  default_scope { order(created_at: :desc) }


  def self.replies(text, user)
    self.replies.create(body: text, user: user)
  end
end
##TODO VIES TO NESTED comments replies