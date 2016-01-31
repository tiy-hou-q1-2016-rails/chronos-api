class Student < ActiveRecord::Base
  belongs_to :cohort

  validates :name, :cohort, :email, :phone_number, presence: true

  has_secure_password
  has_many :checkins
end
