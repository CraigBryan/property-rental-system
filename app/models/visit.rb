class Visit < ActiveRecord::Base
  belongs_to :property
  belongs_to :user

  validates_presence_of :property, 
                        :user, 
                        :time, 
                        :date
end
