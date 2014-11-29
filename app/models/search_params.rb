class SearchParams
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :locations, 
                :types,
                :number_bedrooms, 
                :number_bathrooms, 
                :min_rent, 
                :max_rent

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end