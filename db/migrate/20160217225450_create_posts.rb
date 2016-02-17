class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamp :posted
      t.integer :author

      t.timestamps null: false
    end
  end
end
