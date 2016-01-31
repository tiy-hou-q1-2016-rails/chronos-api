class Api::RegistrationController < Api::BaseController

  skip_before_action :doorkeeper_authorize!

  def create
    @student = Student.new
    @student.name = params[:name]
    @student.email = params[:email]
    @student.password = params[:password]
    @student.cohort = Cohort.find_by cohort_signup_code: params[:cohort_signup_code]

    if @student.save
      render "api/me/show", status: 201
    else
      render json: @student.errors, status: 422
    end
  end
end
