class User < ActiveRecord::Base
  @@minimum_password_length = 8

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: @@minimum_password_length }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
end
