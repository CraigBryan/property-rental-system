class PropertiesController < ApplicationController
  #TODO only allow add for owners and agents
  before_action :ensure_authorized, :only => [:new, :create]

  def new
    @property = Property.new
  end

  def create
    @property = Property.new property_params
    @property.
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

  private:

  def ensure_authorized
    unless(current_user.is_role_by_name?('admin') || 
           current_user.is_role_by_name?('owner'))
      render 'common/not_authorized'
    end    
  end
end
