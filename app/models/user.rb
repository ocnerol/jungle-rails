class User < ActiveRecord::Base
  @@minimum_password_length = 8

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: @@minimum_password_length }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  def self.authenticate_with_credentials(email, password)
    # returns an instance of the user (if successfully authenticated) otherwise nil
    user = User.where('lower(email) = ?', email.strip.downcase).take
    user && user.authenticate(password)
  end

end
