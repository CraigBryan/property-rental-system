class Photo < ActiveRecord::Base
  belongs_to :property

  validates_presence_of :property,
                        :file
end
