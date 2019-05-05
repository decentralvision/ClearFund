class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.boolean :active
      t.integer :user_id
      t.integer :proposal_id

      t.timestamps
    end
  end
end
