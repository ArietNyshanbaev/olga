class CreateComentbs < ActiveRecord::Migration
  def change
    create_table :comentbs do |t|
      t.text :content
      t.references :user, index: true
      t.references :micropost, index: true

      t.timestamps null: false
    end
    add_foreign_key :comentbs, :users
    add_foreign_key :comentbs, :microposts
    add_index :comentbs, [:user_id, :micropost_id, :created_at]
  end
end
