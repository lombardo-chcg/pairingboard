class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.text :body
      t.integer :sender_id
      t.boolean :read, default: false 

      t.timestamps(null: false)
    end
  end
end
