class Visit < ActiveRecord::Base
  belongs_to :property
  belongs_to :customer_account

  #TODO is this the right way to validate that the visit has a property? and a customer_account?
  validates_presence_of :property, :customer_account, :time, :date
end
