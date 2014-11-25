class FixLease < ActiveRecord::Migration
  def change
    remove_column :leases, :email_address, :string
    remove_column :leases, :downloadLink, :string
    add_column :leases, :download_link, :string
  end
end
