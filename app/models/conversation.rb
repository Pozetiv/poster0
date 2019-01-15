class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: "sender_id"
  belongs_to :receiver, class_name: 'User', foreign_key: "receiver_id"
  has_many :messages,-> { reorder(created_at: :ASC) }, class_name: 'Comment', as: :commentable

  validates :sender, uniqueness: { scope: :receiver }

  scope :between, -> (sender_id,receiver_id) do
    where(sender_id: sender_id, receiver_id: receiver_id)
    .or(where(sender_id: receiver_id, receiver_id: sender_id)).limit(1)
  end
  
  scope :participating, -> (user_id) { where(sender_id: user_id).or(where(receiver_id: user_id)) }

  def recipient(current_user)
    sender == current_user ? receiver : sender
  end
end
