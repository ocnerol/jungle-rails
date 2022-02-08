require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'successfully saves when provided matching password and password_confirmation' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password: '123pass!!',
        password_confirmation: '123pass!!',
        email: 'Louis@email.com'
          })

      expect(User.exists?(user.id)).to be_truthy
    end
    
    it 'raises an error when a password is not provided' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password_confirmation: '123pass!!',
        email: 'Louis@email.com'
          })
      errors = user.errors.full_messages

      expect(errors).to include("Password can't be blank")
    end

    it 'raises an error when a password confirmation is not provided' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password_confirmation: '123pass!!',
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
        password_confirmation: '123pass!!',
        email: 'Louis@email.com'
          })
      errors = user.errors.full_messages

      expect(errors).to include("Password confirmation doesn't match Password")
    end

    it 'raises an error when provided email is already assigned to an existing user' do
      user_1 = User.create({
        first_name: 'Mateo',
        last_name: 'Flores',
        password: 'roses123',
        password_confirmation: 'roses123',
        email: 'M.flores@EMAIL.com'
      })

      user_2 = User.create({
        first_name: 'Mirabel',
        last_name: 'Flores',
        password: 'roses152',
        password_confirmation: 'roses152',
        email: 'm.flores@email.COM'
      })
      user_2_errors = user_2.errors.full_messages

      expect(user_2_errors).to include("Email has already been taken")
    end

    it 'raises an error when a first name is not provided' do
      user = User.create({
        last_name: 'Torres',
        password: '123pass!!',
        password_confirmation: '123pass!!',
        email: 'Louis@email.com'
          })
      
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'raises an error when a last name is not provided' do
      user = User.create({
        first_name: 'Rey',
        password: '123pass!!',
        password_confirmation: '123pass!!',
        email: 'Louis@email.com'
          })
      
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'raises an error when an email is not provided' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password: '123pass!!',
        password_confirmation: '123pass!!'
          })

      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'raises an error when provided password is too short' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Torres',
        password: 'dfsd34f',
        password_confirmation: 'dfsd34f',
        email: 'Louis@email.com'
          })

      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    
    it 'returns nil if user cannot be authenticated with given email and password' do
      email = 'example@email.com'
      password = '12345678'

      expect(User.authenticate_with_credentials(email, password)).to be_nil
    end

    it 'returns the user instance if email and password can be authenticated' do
      user = User.create({
        first_name: 'Louis',
        last_name: 'Roses',
        password: '123pass!!',
        password_confirmation: '123pass!!',
        email: 'LouisRoses@email.com'
      })

      email = user.email
      password = user.password

      expect(User.authenticate_with_credentials(email, password)).to eql(user)
    end

    it 'authenticates user if provided email has trailing spaces before or after email' do
      user = User.create({
        first_name: 'Lora',
        last_name: 'Nci',
        password: 'loralora',
        password_confirmation: 'loralora',
        email: 'LoraNci@email.com'
      })

      email = "  LoraNci@email.com   "
      password = user.password

      expect(User.authenticate_with_credentials(email, password)).to eql(user)
    end

  end
end
