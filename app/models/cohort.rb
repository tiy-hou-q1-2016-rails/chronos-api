class Cohort < ActiveRecord::Base
  has_many :students
  has_many :days
  validates :name, :campus_name, :beacon_id, :cohort_signup_code, presence: true

  validates :start_hour_utc, presence: true, inclusion: { in: (0..24).to_a}
  validates :start_min_utc, presence: true, inclusion: { in: (0..59).to_a}
end
