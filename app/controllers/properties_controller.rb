class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new property_params
    if @property.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def index
    @properties = Property.all
  end

  private

  def property_params
    params.require(:property).permit(:address)
  end
end
