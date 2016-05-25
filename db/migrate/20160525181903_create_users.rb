class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.integer :current_phase
      t.string :phone_number
      t.text :description

      t.timestamps(null: false)
    end
  end
end
