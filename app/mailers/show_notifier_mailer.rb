# frozen_string_literal: true

class ShowNotifierMailer < ApplicationMailer
  def notify_user(show_id, user_id)
    @show = Show.find(show_id)
    @user = User.find(user_id)
    mail to: @user.email
  end
end
