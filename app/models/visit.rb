class Visit < ActiveRecord::Base
  belongs_to :property
  belongs_to :customer_account

  validates :time, 
            :presence => true
  validates :date,
            :presence => true
end
