class Cohort < ActiveRecord::Base
  has_many :students
  validates :name, :campus_name, :beacon_id, presence: true
end
