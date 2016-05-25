class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :mentor_id
      t.boolean :available, default: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps(null: false)
    end
  end
end
