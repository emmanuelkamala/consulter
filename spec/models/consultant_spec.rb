require 'rails_helper'

RSpec.describe Consultant do
  describe 'attributes' do
    it 'is valid with valid attributes' do
      consultant = Consultant.new(email: 'ejoka@hotmail.com',
                                  first_name: 'myejoka',
                                  last_name: 'andrew',
                                  profession: 'Lawyer',
                                  password: 'tanzania'
                                )
      expect(consultant).to be_valid
    end

    it 'is valid with valid email' do
      consultant = Consultant.new(email: 'ejoka@hotmail.com',
                                  first_name: 'myejoka',
                                  last_name: 'andrew',
                                  profession: 'Lawyer',
                                  password: 'tanzania'
                                )
      consultant.email = 'ejoka'
      expect(consultant.email).to_not be true
    end

    it 'has to have a profession' do
      consultant = Consultant.new(email: 'ejoka@hotmail.com',
                                  first_name: 'myejoka',
                                  last_name: 'andrew',
                                  profession: 'Lawyer',
                                  password: 'tanzania'
                                )
      consultant.profession = ' '
      expect(consultant.email).to_not be true
    end

    it 'has to have a first name' do
      consultant = Consultant.new(email: 'ejoka@hotmail.com',
                                  first_name: 'myejoka',
                                  last_name: 'andrew',
                                  profession: 'Lawyer',
                                  password: 'tanzania'
                                )
      consultant.first_name = ' '
      expect(consultant.first_name).to_not be true
    end

    it 'has to have a last name' do
      consultant = Consultant.new(email: 'ejoka@hotmail.com',
                                  first_name: 'myejoka',
                                  last_name: 'andrew',
                                  profession: 'Lawyer',
                                  password: 'tanzania'
                                )
      consultant.last_name = ' '
      expect(consultant.last_name).to_not be true
    end
  end
end
