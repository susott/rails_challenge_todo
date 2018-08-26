class User < ApplicationRecord
  attr_writer :login
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

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

end
