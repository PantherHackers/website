class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :name
      t.string :date
      t.string :location
      t.boolean :highschool
      t.string :logo
      t.string :site

      t.timestamps null: false
    end
  end
end
