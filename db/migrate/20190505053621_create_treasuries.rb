# frozen_string_literal: true

class CreateTreasuries < ActiveRecord::Migration[5.2]
  def change
    create_table :treasuries do |t|
      t.float :funds

      t.timestamps
    end
  end
end
