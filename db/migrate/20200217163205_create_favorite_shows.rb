# frozen_string_literal: true

class CreateFavoriteShows < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_shows, &:timestamps
  end
end
