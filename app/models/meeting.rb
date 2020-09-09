class Meeting < ApplicationRecord
  validates :start_time, presence: true, uniqueness: true
  validates :end_time, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :consultant
end
