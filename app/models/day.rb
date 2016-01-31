class Day < ActiveRecord::Base
  belongs_to :cohort
  validates :start_time, presence: true
  validates :cohort, presence: true

  scope :today, lambda {
    where("start_time >= ?",  Date.today.beginning_of_day)
    .where("start_time < ?",  Date.today.end_of_day)
    .first
  }
end
