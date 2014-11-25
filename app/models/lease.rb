class Lease < ActiveRecord::Base
  belongs_to :property
  belongs_to :customer_account

  validates_presence_of :property,
                        :customer_account,
                        :rental_date,
                        :rental_time,
                        :download_link
end
