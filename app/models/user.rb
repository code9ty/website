class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.first_name = first_name.capitalize }
  before_save { self.last_name = last_name.capitalize }
  validates :email, uniqueness: true, presence: true
  validates :first_name, length: {minimum:3}, presence: true
  validates :last_name, length: {minimum:3}, presence: true
  validates :github, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :mobile_number, length: {minimum: 10}

  has_many :comments
  has_many :contributions
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
  # updates the remeber digest on the database
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  #returns a random 22 character
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # returns true if remeber token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
