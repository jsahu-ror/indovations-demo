# frozen_string_literal: true

class CreateJoinTableShowUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :shows, :users do |t|
      t.index %i[show_id user_id]
      t.index %i[user_id show_id]
    end
  end
end
