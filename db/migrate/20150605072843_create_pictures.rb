class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :title
      t.references :user, index: true
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :pictures, :users
    add_index :pictures, [:user_id, :created_at]
  end
end
