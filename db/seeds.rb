# frozen_string_literal: true

user = User.find_or_initialize_by(email: 'test_user@tets.com')
user.password = 'password'
user.save!

channel = Channel.find_or_create_by!(name: 'Sony')
Show.find_or_create_by!(
  start_time: 40.minutes.ago,
  frequency: :daily, name: 'Tokyo Ghoul',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 42.minutes.ago,
  frequency: :weekly, name: 'Mr. Robot',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 45.minutes.ago,
  frequency: :daily, name: 'Pretty Little Liars',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 46.minutes.ago,
  frequency: :daily, name: 'FBI',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 50.minutes.ago,
  frequency: :daily, name: 'Adventure
    Time',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 6.day.from_now - 6.hours, name: 'Saturday Night Live',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 7.day.from_now - 7.hours, name: 'Law & Order: Special Victims Unit',
  channel_id: channel.id
)
Show.find_or_create_by!(
  start_time: 8.day.from_now - 8.hours, name: 'Star Trek: The Next Generation',
  channel_id: channel.id
)
