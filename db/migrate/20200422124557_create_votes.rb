class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :option_id

      t.timestamps
    end

    add_index :votes, :option_id
  end
end
