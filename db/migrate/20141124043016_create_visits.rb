class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
