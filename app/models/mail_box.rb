class MailBox < ApplicationRecord
  belongs_to :user
  has_many :messages, as: :commentable, class_name: 'Comment'
end
