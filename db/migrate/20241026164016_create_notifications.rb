class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :emisor_user, null: false, foreign_key: { to_table: :users }
      t.references :receptor_user, null: false, foreign_key: { to_table: :users }
      t.references :publication, null: false, foreign_key: true

      t.integer :notification_type

      t.timestamps
    end
  end
end
