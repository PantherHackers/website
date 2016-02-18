class RemoveUpdated < ActiveRecord::Migration
  def up
    remove_column :posts, :updated
  end
  def down
    add_column :posts, :updated, :datetime
  end
end
