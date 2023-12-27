# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_logged_in

  private

  def current_administrator
    return unless (administrator_id = session[:administrator_id])

    @current_administrator ||= Administrator.find_by(id: administrator_id)
  end
  helper_method :current_administrator

  def logged_in?
    current_administrator.present?
  end
  helper_method :logged_in?

  def check_logged_in
    return if logged_in?

    redirect_to new_auth_session_path
  end
end
