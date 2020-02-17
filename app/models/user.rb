# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :favorite_shows, class_name: 'Show'
end
