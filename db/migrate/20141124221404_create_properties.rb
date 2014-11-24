class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :prop_type
      t.string :address
      t.string :location
      t.integer :number_bathrooms
      t.integer :number_bedrooms
      t.integer :number_other_rooms
      t.integer :rent_price
      t.boolean :deleted

      t.timestamps
    end
  end
end
