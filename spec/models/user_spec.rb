require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'successfully saves when provided matching password and password_confirmation' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password: '123pass',
        password_confirmation: '123pass',
        email: 'Louis@email.com'
          })

      expect(User.exists?(user.id)).to be_truthy
    end
    
    it 'raises an error when a password is not provided' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password_confirmation: '123pass',
        email: 'Louis@email.com'
          })
      errors = user.errors.full_messages

      expect(errors).to include("Password can't be blank")
    end

    it 'raises an error when a password confirmation is not provided' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password_confirmation: '123pass',
        email: 'Louis@email.com'
          })
      errors = user.errors.full_messages

      expect(errors).to include("Password can't be blank")
    end
    
  end
end
