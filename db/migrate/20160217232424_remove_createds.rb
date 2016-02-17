class RemoveCreateds < ActiveRecord::Migration
  def up
    remove_column :posts, :posted
    remove_column :events, :posted
  end
  def down
    add_column :posts, :posted, :timestamp
    add_column :events, :posted, :timestamp
  end
end
