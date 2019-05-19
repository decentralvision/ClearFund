# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean :active, default: true
      t.float :dues
      t.integer :user_id

      t.timestamps
    end
  end
end
