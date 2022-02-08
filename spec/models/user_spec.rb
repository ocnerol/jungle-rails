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

    it 'raises an error when password confirmation does not match password' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password: 'jdfhskjd',
        password_confirmation: '123pass',
        email: 'Louis@email.com'
          })
      errors = user.errors.full_messages

      expect(errors).to include("Password confirmation doesn't match Password")
    end

    it 'raises an error when provided email is already assigned to an existing user' do
      user_1 = User.create({
        first_name: 'Mateo',
        last_name: 'Flores',
        password: 'roses12',
        password_confirmation: 'roses12',
        email: 'M.flores@EMAIL.com'
      })

      user_2 = User.create({
        first_name: 'Mirabel',
        last_name: 'Flores',
        password: 'roses15',
        password_confirmation: 'roses15',
        email: 'm.flores@email.COM'
      })
      user_2_errors = user_2.errors.full_messages

      expect(user_2_errors).to include("Email has already been taken")
    end

    it 'raises an error when a first name is not provided' do
      user = User.create({
        last_name: 'Torres',
        password: '123pass',
        password_confirmation: '123pass',
        email: 'Louis@email.com'
          })
      
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

  end
end
