class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.datetime :updated
      t.primary_key :id

      t.timestamps null: false
    end
  end
end
