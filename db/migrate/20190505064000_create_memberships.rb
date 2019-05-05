class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean :active, :default => true
      t.integer :dues
      t.integer :user_id

      t.timestamps
    end
  end
end
