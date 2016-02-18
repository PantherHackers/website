class RemoveUpdated < ActiveRecord::Migration
  def up
    remove_column :pages, :updated
  end
  def down
    add_column :pages, :updated, :datetime
  end
end
