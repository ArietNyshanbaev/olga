class CreateComentps < ActiveRecord::Migration
  def change
    create_table :comentps do |t|
      t.text :content
      t.references :user, index: true
      t.references :picture, index: true

      t.timestamps null: false
    end
    add_foreign_key :comentps, :users
    add_foreign_key :comentps, :pictures
    add_index :comentps, [:user_id, :picture_id, :created_at]
  end
end
