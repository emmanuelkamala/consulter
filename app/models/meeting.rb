class Meeting < ApplicationRecord
  validates :start_time, presence: true, uniqueness: true
  validates :end_time, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :consultant_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :consultant
end
