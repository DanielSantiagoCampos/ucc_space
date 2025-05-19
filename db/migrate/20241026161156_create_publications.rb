# frozen_string_literal: true

class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description, limit: 300
      t.string :file
      t.integer :status, default: 0
      t.integer :tag_type

      t.timestamps
    end
  end
end
