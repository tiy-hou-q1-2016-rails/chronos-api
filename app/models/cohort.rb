class Cohort < ActiveRecord::Base
  has_many :students
  has_many :days
  validates :name, :campus_name, :beacon_id, presence: true
end
