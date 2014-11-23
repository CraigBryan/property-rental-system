class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fName
      t.string :lName
      t.string :email
      t.string :typeOfAccount
      t.integer :maxRent
      t.date :creationDate
      t.time :creationTime

      t.timestamps
    end
  end
end
