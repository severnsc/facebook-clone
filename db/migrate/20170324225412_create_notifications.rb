class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user
      t.integer :sender_id
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
