class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.integer :funding_goal
      t.integer :funding
      t.datetime :expiration
			t.integer :user_id
			
      t.timestamps
    end
  end
end
