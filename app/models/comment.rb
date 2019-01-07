class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, class_name: 'Comment', as: :commentable, dependent: :destroy

  validates :body, presence: true, length: { minimum: 2 }

  default_scope { order(created_at: :desc) }

  def time
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end
end
