class Photo < ActiveRecord::Base
  belongs_to :property

  validate_presence_of :property,
                       :file
end
