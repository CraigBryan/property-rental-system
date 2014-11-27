class SetDefaultDeletedProperty < ActiveRecord::Migration
  def change
    remove_column :properties, :deleted, :boolean
    add_column :properties, :deleted, :boolean, :default => false
  end
end
