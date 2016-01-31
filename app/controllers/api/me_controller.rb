class Api::MeController < Api::BaseController

  def show
    @student = current_student
  end

  def history
    @checkins = current_student.checkins.historical.order("checkin_at desc")
  end
end
