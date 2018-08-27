class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :campaigns
  has_many :to_do_lists
  has_many :to_dos

  # status attribute can have three different data values of
  # “:qualified, :not_qualified,:banned” .

  validates :username, presence: true,
                       length: { in: 2..50 },
                       uniqueness: { case_sensitive: false }
  validates :status, :inclusion => { :in => ['qualified', 'not_qualified', 'banned']}
end
