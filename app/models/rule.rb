class Rule < ApplicationRecord
  validates :title, presence: true, length: { in: 2..40 }
  validates :text, presence: true, length: { minimum: 2 }

  belongs_to :community
end
