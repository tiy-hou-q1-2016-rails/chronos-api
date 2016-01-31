class Api::MeController < ApplicationController

  before_action :doorkeeper_authorize!

  def show
  end

  private
  def current_student
    if doorkeeper_token
      @current_student ||= Student.find(doorkeeper_token.resource_owner_id)
    end
  end
  helper_method :current_student
end
