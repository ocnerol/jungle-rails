class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  
end
