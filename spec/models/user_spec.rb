require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  dummy_user = { username: 'omar', email: 'omar@ramo.com', password: 'omaruramo',
                 password_confirmation: 'omaruramo' }
  invalid_dummy_user = { username: 'aa', email: '@aa', password: 'pass', password_confirmation: 'omaruramo' }

  RSpec.describe User do
    context 'checking db validations' do
      it 'creates a users' do
        user1 = User.new(dummy_user)
        expect(user1.valid?).to eq(true)
      end
      it 'rejects users' do
        invalid_user = User.new(invalid_dummy_user)
        expect(invalid_user.valid?).to eq(false)
      end
      it 'return correct error output' do
        invalid_user = User.new(invalid_dummy_user)
        invalid_user.valid?
        error_msgs = ['Username is too short (minimum is 3 characters)', 'Email is invalid',
                      'Password is too short (minimum is 6 characters)', "Password confirmation doesn't match Password"]
        expect(invalid_user.errors.full_messages).to eq(error_msgs)
      end
      it 'return correct error output if user exists' do
        User.create(dummy_user)
        user1 = User.new(dummy_user)
        expect(user1.valid?).to eq(false)
      end
      it 'return correct error output if user exists' do
        User.create(dummy_user)
        user1 = User.new(dummy_user)
        user1.valid?
        expect(user1.errors.full_messages).to eq(['Username has already been taken', 'Email has already been taken'])
      end
    end
  end
end
