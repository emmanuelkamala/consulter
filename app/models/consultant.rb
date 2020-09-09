class Consultant < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :meetings, dependent: :destroy
  has_many :users, through: :meetings
end
