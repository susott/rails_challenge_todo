class ToDo < ApplicationRecord
  belongs_to :to_do_list
  belongs_to :user
  has_many :comments
  validates :name, presence: true, length: { in: 2..50 }
  validates :description, length: { maximum: 500 }

end
