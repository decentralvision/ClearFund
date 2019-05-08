# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.boolean :active, default: true
      t.integer :user_id
      t.integer :proposal_id

      t.timestamps
    end
  end
end
