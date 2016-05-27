class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :mentor_id
      t.boolean :available, default: true
      t.date :offering_date
      t.string :start_time

      t.timestamps(null: false)
    end
  end
end
