class User < ApplicationRecord
  before_save { self.first_name = first_name.capitalize }
  before_save { self.last_name = last_name.capitalize }
  validates :email, uniqueness: true, presence: true
  validates :first_name, length: {minimum:3}, presence: true
  validates :last_name, length: {minimum:3}, presence: true
  validates :github, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :mobile_number, length: {minimum: 10}

  has_many :comments
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
