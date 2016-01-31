class DailyBook

  def self.create_for_all
    Cohort.find_each do |cohort|
      DailyBook.create_for(cohort)
    end
  end

  def self.create_for(cohort)

    if Date.today.saturday? || Date.today.sunday?
      Rails.logger.info "DailyBook -> Nothing to do: We don't work on weekend!"
      return
    end

    day = cohort.days.create! start_time: DateTime.now.utc.change(hour: cohort.start_hour_utc, min: cohort.start_min_utc)

    Checkin
      .historical
      .joins(:student)
      .where("students.cohort_id" => cohort.id)
      .where(status: "pending")
      .update_all(status: "absent")

    cohort.students.each do |student|
      Checkin.create! student: student, day: day
    end

    day
  end

end
