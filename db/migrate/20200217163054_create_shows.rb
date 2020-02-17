# frozen_string_literal: true

class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.references :channel
      t.datetime :start_time
      t.integer :frequency, default: 0
      t.timestamps
    end

    add_index :shows, :name
  end
end
