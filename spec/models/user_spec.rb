require 'rails_helper'

RSpec.describe User, type: :model do

  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      user = User.create(
          name: 'james bond', 
          email: 'test@test.com', 
          password: 'powpow', 
          password_confirmation: 'powpow'
        )
        user = User.authenticate_with_credentials('test@test.com', 'powpow')
        expect(user).not_to be(nil)
    end

    it 'should pass check if email is in db and password matches email ' do
      user = User.create(
              name: 'james bond', 
              email: 'example@domain.com', 
              password: 'powpow', 
              password_confirmation: 'powpow'
            )
        check = User.authenticate_with_credentials('example@domain.com', 'powpow')
    expect(check).to be ==(user)
    end
  end
end
