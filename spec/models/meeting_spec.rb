require 'rails_helper'

RSpec.describe Meeting, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belong_to(:user) }
  it { should belong_to(:consultant) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:consultant_id) }
end
