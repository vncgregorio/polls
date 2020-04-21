class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.integer :poll_id

      t.timestamps
    end

    add_index :views, :poll_id
  end
end
