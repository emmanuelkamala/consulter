require 'rails_helper'

describe Meeting, :type => :model do 
  describe 'attributes' do
    it 'is valid with valid attributes' do 
      meeting = Meeting.new(name: 'Social anxiety help', start_time: '2020-09-05 13:00', end_time: '2020-09-05 14:00', user_id: 1)
      expect(meeting).to be_valid
    end

    it 'is valid with valid name' do 
      meeting = Meeting.new(name: 'Social anxiety help', start_time: '2020-09-05 13:00', end_time: '2020-09-05 14:00', user_id: 1)
      meeting.name = 'Social anxiety help'
      expect(meeting.name).to_not be true
    end

    it 'is valid with valid time' do 
      meeting = Meeting.new(name: 'Social anxiety help', start_time: '2020-09-05 13:00', end_time: '2020-09-05 14:00', user_id: 1)
      meeting.start_time = '2018-09-05 13:00'
      expect(meeting.start_time).to_not be true
    end
  end
end