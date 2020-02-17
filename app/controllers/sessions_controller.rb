# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:destroy]
  def new; end

  def destroy
    session[:id] = nil
    redirect_to new_session_path
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      session[:id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'wrong password'
      redirect_to new_session_path
    end
  end
end
