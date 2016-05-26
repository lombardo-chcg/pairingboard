class CreateConversers < ActiveRecord::Migration
  def change
    create_table :conversers do |t|
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps(null: false)
    end
  end
end
