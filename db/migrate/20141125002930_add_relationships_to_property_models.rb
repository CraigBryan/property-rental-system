class AddRelationshipsToPropertyModels < ActiveRecord::Migration
  def change
    add_reference :photos, :property, index: true
    add_reference :visits, :property, index: true
    add_reference :leases, :property, index: true
  end
end
