class CreateTreasuries < ActiveRecord::Migration[5.2]
  def change
    create_table :treasuries do |t|
      t.integer :funds

      t.timestamps
    end
  end
end
