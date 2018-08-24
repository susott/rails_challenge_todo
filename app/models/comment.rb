class Comment < ApplicationRecord
  # Comment compose of only title.
  belongs_to :user
  belongs_to :campaign, optional: true
  belongs_to :to_do, optional: true

  validates :title, presence: true, length: { in: 2..300 }
end
