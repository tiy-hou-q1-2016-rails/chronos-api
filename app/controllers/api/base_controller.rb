class Api::BaseController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :doorkeeper_authorize!
  before_action do
    request.format = :json
  end

  private
  def current_student
    if doorkeeper_token
      @current_student ||= Student.find(doorkeeper_token.resource_owner_id)
    end
  end
  helper_method :current_student
end
