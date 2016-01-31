class Checkin < ActiveRecord::Base
  belongs_to :student
  belongs_to :day

  scope :today, lambda {
    joins(:day)
    .where("days.start_time >= ?",  Date.today.beginning_of_day)
    .where("days.start_time < ?",  Date.today.end_of_day)
  }

  scope :historical, lambda { joins(:day).where("days.start_time < ?", Date.today.end_of_day)}

  scope :for_student,  -> (student ){ find_by(student_id: student.id)}

  def checkin!
    self.checkin_at = Time.now
    if (self.checkin_at  - self.day.start_time) > 15.minutes
      self.status = "late"
    else
      self.status = "ok"
    end
    save
  end
end
