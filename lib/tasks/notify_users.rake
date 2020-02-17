# frozen_string_literal: true

namespace :show do
  task notify_users: :environment do
    relation = Show.includes(:users).joins(:users)

    relation.where.not(frequency: :one_time).start_in_30_minutes.find_each do |show|
      send_mail_to_users(show)
    end

    relation.where(frequency: :one_time).where(start_time: 1.hour.ago..30.minutes.ago).find_each do |show|
      send_mail_to_users(show)
    end
  end
end

def send_mail_to_users(show)
  time = Time.parse(show.start_time.strftime('%H:%M:%S'))
  minutes_to_start = (30.minutes.ago - time) / 60
  show.users.ids.each do |user_id|
    ShowNotifierMailer.notify_user(show.id, user_id).deliver_later(wait: minutes_to_start.minutes)
  end
end
