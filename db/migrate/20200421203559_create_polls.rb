class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :description

      t.timestamps
    end

    add_index :polls, :description
  end
end
