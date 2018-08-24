class ToDo < ApplicationRecord
  belongs_to :to_do_list
  has_many :comments
  validates :name, presence: true, length: { in: 2..50 }
  validates :description, length: { in: 0..500 }

end
