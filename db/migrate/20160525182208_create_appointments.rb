class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :student_id
      t.integer :offering_id

      t.timestamps(null: false)
    end
  end
end
