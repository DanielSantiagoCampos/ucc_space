class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publicaciones do |t|
      # t.references :user, null: false, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :description, limit: 300
      t.string :file
      t.integer :status
      t.integer :tag_type

      t.timestamps
  end
end
