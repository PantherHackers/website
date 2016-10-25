class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
