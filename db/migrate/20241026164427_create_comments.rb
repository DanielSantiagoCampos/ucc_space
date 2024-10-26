class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :publication, null: false, foreign_key: { to_table: :publicaciones }
      t.references :emisor_user, null: false, foreign_key: { to_table: :usuarios }
      t.string :comment, limit: 100

      t.timestamps
    end
  end
end
