# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :publication, null: false, foreign_key: { to_table: :publications }
      t.references :emisor_user, null: false, foreign_key: { to_table: :users }
      t.string :comment, limit: 100

      t.timestamps
    end
  end
end
