module FilterHelper

  #This is WET code. Gross.
  def filter_properties filterable, filters

    #filter by location
    unless filters[:locations].nil? #TODO needs better check (array of empty strings?)
      results = []
      allowed_locations = filters[:location]

      filterable.each do |item|
        results.push(item) if allowed_locations.include? item.location
      end

      filterable = results
    end

    #filter by type
    unless filters[:type].nil? || filters[:type] == ""
      results = []
      allowed = filters[:type]

      filterable.each do |item|
        results.push(item) if allowed == item.type 
      end

      filterable = results
    end

    #filter by number of bedrooms
    unless filters[:number_bedrooms].nil? || filters[:number_bedrooms] == ""
      results = []
      allowed = filters[:number_bedrooms].to_i

      filterable.each do |item|
        results.push(item) if allowed == item.number_bedrooms
      end

      filterable = results
    end

    #filter by number of bathrooms
    unless filters[:number_bathrooms].nil? || filters[:number_bathrooms] == ""
      results = []
      allowed = filters[:number_bathrooms].to_i

      filterable.each do |item|
        results.push(item) if allowed == item.number_bathrooms
      end

      filterable = results
    end

    #filter by min rent
    unless filters[:min_rent].nil? || filters[:min_rent] == ""
      results = []
      allowed = filters[:min_rent].to_i

      filterable.each do |item|
        results.push(item) if item.rent_price >= allowed
      end

      filterable = results
    end

    #filter by max rent
    unless filters[:max_rent].nil? || filters[:max_rent] == ""
      results = []
      allowed = filters[:max_rent].to_i

      filterable.each do |item|
        results.push(item) if item.rent_price <= allowed
      end

      filterable = results
    end

    return filterable
  end
end