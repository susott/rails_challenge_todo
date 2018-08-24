class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign, optional: true
  belongs_to :to_do, optional: true
end
