class ToDoList < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  has_many :to_dos
end
