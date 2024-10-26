class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: { to_table: :usuarios }
      t.references :publication, null: false, foreign_key: { to_table: :publicaciones }

      t.timestamps
    end
  end
end
