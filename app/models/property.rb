class Property < ActiveRecord::Base
  has_many :visits, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :leases, :dependent => :destroy
  belongs_to :user

  validates_presence_of :user,
                        :prop_type,
                        :address,
                        :number_bedrooms,
                        :number_bathrooms,
                        :number_other_rooms,
                        :rent_price

  validates :number_bedrooms, :numericality => { :greater_or_equal_to  => 0 }
  validates :number_bathrooms, :numericality => { :greater_or_equal_to  => 0 }
  validates :number_other_rooms, :numericality => { :greater_or_equal_to  => 0 }
  validates :rent_price, :numericality => { :greater_or_equal_to  => 0 }

  self.per_page = 25
end
