class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :credit_card_type
      t.string :credit_card_number
      t.string :credit_card_holder_name
      t.integer :expiry_month
      t.integer :expiry_year

      t.timestamps
    end
  end
end
