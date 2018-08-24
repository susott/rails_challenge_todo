class User < ApplicationRecord
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :campaigns
  has_many :to_do_lists

  # status attribute can have three different data values of
  # “:qualified, :not_qualified,:banned” .
  validates :username, presence: true, length: { in: 2..50 }
  validates :status, inclusion: { in: %w(qualified not_qualified banned)}

  def login
    @login || self.username || self.email
  end

end
