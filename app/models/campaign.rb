class Campaign < ApplicationRecord
  # A campaign is composed of title, tags and estimated duration [in min].
  belongs_to :user
  has_many :to_do_lists
  has_many :comments

  validates :title, presence: true, length: { in: 2..50 }
  validates :duration, presence: true, numericality: { only_integer: true }

end
