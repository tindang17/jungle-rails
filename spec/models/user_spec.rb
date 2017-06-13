require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    
    it 'should successfully save user if all fields are present' do
      user = User.create!({
        first_name: 'tin',
        last_name: 'dang',
        email: 'tind@sfu.ca',
        password: '123456',
        password_confirmation: '123456'
      })
      expect(user).to(be_valid)
    end
    
    it 'should include an error message if password and password_confirmation does not match' do
      user = User.create({
        first_name: 'tin',
        last_name: 'dang',
        email: 'tind@sfu.ca',
        password: '123456',
        password_confirmation: '12345'
      })
      expect(user.errors.has_key?(:password_confirmation)).to be_truthy
    end
  
    it 'should include an error message if first_name is not present' do
       user = User.create({
        first_name: nil,
        last_name: 'dang',
        email: 'tind@sfu.ca',
        password: '123456',
        password_confirmation: '123456'
       })
       expect(user.errors.has_key?(:first_name)).to be_truthy
    end
    it 'should include an error message if last_name is not present' do
       user = User.create({
        first_name: 'tin',
        last_name: nil,
        email: 'tind@sfu.ca',
        password: '123456',
        password_confirmation: '123456'
       })
       expect(user.errors.has_key?(:last_name)).to be_truthy
    end
    it 'should include an error message if email is not present' do
       user = User.create({
        first_name: 'tin',
        last_name: 'dang',
        email: nil,
        password: '123456',
        password_confirmation: '123456'
       })
       expect(user.errors.has_key?(:email)).to be_truthy
    end
    it 'should include an error message if password is not present' do
       user = User.create({
        first_name: 'tin',
        last_name: 'dang',
        email: 't@t',
        password: nil,
        password_confirmation: '123456'
       })
       expect(user.errors.has_key?(:password)).to be_truthy
    end
    it 'should include an error if email is not unique' do
      user = User.create!({
        first_name: 'tin',
        last_name: 'dang',
        email: 'tind@sfu.ca',
        password: '123456',
        password_confirmation: '123456'
      })
      user2 = User.create({
        first_name: 'tin',
        last_name: 'dang',
        email: 'tinD@sfu.ca',
        password: '123456',
        password_confirmation: '123456'
      })
      expect(user2.errors.has_key?(:email)).to be_truthy
    end
     
    it 'should include an error message if password is less than 6 characters' do
      user = User.create({
      first_name: 'tin',
      last_name: 'dang',
      email: 't@t',
      password: '123',
      password_confirmation: '123'
      })
      expect(user.errors.has_key?(:password)).to be_truthy
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should allow user to login when user enters the right credentials' do
      user = User.create({
      first_name: 'tin',
      last_name: 'dang',
      email: 't@t',
      password: '123456',
      password_confirmation: '123456'
      })
      session = User.authenticate_with_credentials(' t@t ', '123456')
      expect(session).to eq user
    end
  end
  
end
