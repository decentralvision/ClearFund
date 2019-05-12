# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :google_token
      t.string :google_refresh_token
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
