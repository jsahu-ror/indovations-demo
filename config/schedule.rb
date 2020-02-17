# frozen_string_literal: true

every 30.minutes do
  rake 'shows:notify_users'
end
