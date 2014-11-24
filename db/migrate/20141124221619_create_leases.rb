class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.string :email_address
      t.date :rental_date
      t.time :rental_time
      t.string :downloadLink

      t.timestamps
    end
  end
end
