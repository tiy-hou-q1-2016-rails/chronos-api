class Api::MeController < Api::BaseController

  def show
  end

  def history
    @checkins = current_student.checkins.historical.order("checkin_at desc")
  end
end
