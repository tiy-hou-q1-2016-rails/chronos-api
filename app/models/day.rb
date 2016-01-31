class Day < ActiveRecord::Base
  belongs_to :cohort
  validates :start_time, presence: true
  validates :cohort, presence: true
end
