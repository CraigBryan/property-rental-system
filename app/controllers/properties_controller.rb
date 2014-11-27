class PropertiesController < ApplicationController
  #TODO only allow add for owners and agents

  def new
    @property = Property.new
  end

  def create
    @property = Property.new property_params
    #TODO add owner info
    if @property.save
      redirect_to action: 'index' #TODO do something more logical instead
    else
      puts @property.errors.full_messages
      render 'new'
    end
  end

  def index
    @properties = Property.all
  end

  private

  def property_params
    params.require(:property).permit(:prop_type, 
                                     :location, 
                                     :address, 
                                     :number_bathrooms,
                                     :number_bedrooms,
                                     :number_other_rooms,
                                     :rent_price)
  end
end
