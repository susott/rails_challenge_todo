class Campaign < ApplicationRecord
  belongs_to :user
  has_many :to_do_lists
  has_many :comments
end
