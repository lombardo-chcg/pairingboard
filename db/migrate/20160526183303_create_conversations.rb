class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :creator_id
      t.integer :joiner_id
      t.timestamps(null: false)
    end
  end
end
