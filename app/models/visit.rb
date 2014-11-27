class Visit < ActiveRecord::Base
  belongs_to :property
  belongs_to :customer_account

  validates_presence_of :property, 
                        :customer_account, 
                        :time, 
                        :date
end
