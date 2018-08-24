class ToDoList < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  has_many :to_dos
  validates :listname, presence: true, length: { in: 2..50 }
end
