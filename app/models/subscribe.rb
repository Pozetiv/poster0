class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :community, counter_cache: true

  validates :community_id, uniqueness: { scope: :user_id }
end
