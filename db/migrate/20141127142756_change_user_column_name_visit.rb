class ChangeUserColumnNameVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :user, index: true
  end
end
