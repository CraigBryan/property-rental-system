class User < ActiveRecord::Base
  # Variables
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #Not the safest implementation in the world but will do for this

  # constraints for the attributes of Users
  before_save { self.email = email.downcase } #before saving the account, it puts all emails in downcase
  validates :fName, presence: true, length: {maximum: 50}
  validates :lName, presence: true, length: {maximum: 50}
  validates :typeOfAccount, presence: true, length: {maximum: 8, minimum: 5}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: { case_sensitive: false }

  #method that hashes passwords
  has_secure_password
  validates :password, confirmation: true, length: { minimum: 6, maximum: 20 }
  validates :password_confirmation, presence: true
end
