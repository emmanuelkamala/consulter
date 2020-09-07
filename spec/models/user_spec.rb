require 'rails_helper'

RSpec.describe User do
  describe 'attributes' do
    it 'is valid with valid attributes' do
      user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka', password: 'tanzania')
      expect(user).to be_valid
    end

    it 'is valid with valid email' do
      user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka', password: 'tanzania')
      user.email = 'ejoka'
      expect(user.email).to_not be true
    end
  end
end
