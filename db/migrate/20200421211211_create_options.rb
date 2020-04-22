class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.integer :poll_id
      t.integer :number
      t.string :description

      t.timestamps
    end

    add_index :options, [:poll_id, :number]
  end
end
