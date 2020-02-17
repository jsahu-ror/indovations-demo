# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :channel
  has_and_belongs_to_many :users

  enum frequency: %i[one_time daily weekly]

  scope :start_in_30_minutes, lambda {
                                where('start_time::time > ? AND start_time::time <  ?', 1.hour.ago, 30.minutes)
                              }
end
