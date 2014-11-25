class Property < ActiveRecord::Base
  has_many :visits, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :leases, :dependent => :destroy
  belongs_to :owner_account

  validate_presence_of :owner_account,
                       :prop_type,
                       :address,
                       :number_bedrooms,
                       :number_bathrooms,
                       :number_other_rooms,
                       :rent,
                       :deleted

  validate :number_bedrooms, :numericality => { :greater_or_equal_to  => 0 }
  validate :number_bathrooms, :numericality => { :greater_or_equal_to  => 0 }
  validate :number_other_rooms, :numericality => { :greater_or_equal_to  => 0 }
  validate :rent, :numericality => { :greater_or_equal_to  => 0 }
end