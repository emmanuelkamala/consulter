require 'rails_helper'

# RSpec.describe User do
#   describe 'attributes' do
#     it 'is valid with valid attributes' do
#       user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka', password: 'tanzania')
#       expect(user).to be_valid
#     end

#     it 'is valid with valid email' do
#       user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka', password: 'tanzania')
#       user.email = 'ejoka'
#       expect(user.email).to_not be true
#     end

#     it 'is has to have a value of email' do
#       user = User.new(email: 'ejoka@hotmail.com', username: 'ejoka', password: 'tanzania')
#       user.email = ' '
#       expect(user.email).to_not be true
#     end
#   end
# end
RSpec.describe User, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:meetings).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
end
