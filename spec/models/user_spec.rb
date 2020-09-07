require 'rails_helper'

describe User, :type => :model do
  describe 'attributes' do
    it 'is valid with valid attributes' do
      user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka', password_digest: 'tanzania')
      expect(user).to be_valid
    end

    it 'is valid with valid email' do
      user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka' password_digest: 'tanzania')
      user.email = 'ejoka'
      expect(user.email).to_not be true
    end
  end
end
