class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :publication, null: false, foreign_key: { to_table: :publications }

      t.timestamps
    end
  end
end
