class AddMaxRentToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :max_rent, :integer
  end
end
