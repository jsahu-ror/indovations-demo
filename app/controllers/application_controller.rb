# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    return if current_user.present?

    flash[:error] = 'Please login first.'
    redirect_to new_session_path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end
end
