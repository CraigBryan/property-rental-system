class Property < ActiveRecord::Base
  has_many :visits
  has_many :photos
  has_many :leases
  belongs_to :owner_account
end
