# frozen_string_literal: true

class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.integer :funding_goal
      t.integer :funding, default: 0
      t.boolean :active, default: true
      t.date :expiration
      t.integer :user_id

      t.timestamps
    end
  end
end
