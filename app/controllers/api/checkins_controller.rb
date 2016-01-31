class Api::CheckinsController < Api::BaseController

  def checkin

    beacon_id = params["beacon_id"]
    if current_student.cohort.beacon_id != beacon_id
      errors = ["Beacon ID is not attached to your classroom cohort"]
      render json: errors, status: 422
      return
    end

    @checkin = Checkin.today.for_student(current_student)
    if @checkin.blank?
      render text: "Missing Checkin", status: 404
      return
    end

    @checkin.checkin! if @checkin.status == "pending"

    render :show
  end
end
