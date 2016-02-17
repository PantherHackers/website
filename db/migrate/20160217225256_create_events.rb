class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :start
      t.datetime :end
      t.timestamp :posted
      t.primary_key :id
      t.integer :author

      t.timestamps null: false
    end
  end
end
