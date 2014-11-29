require 'fileutils'

class PropertiesController < ApplicationController
  include FilterHelper
  before_action :ensure_authorized, :only => [:new, :create, :destroy]

  def new
    @property = Property.new
    flash[:notice] = "Property successfully added"
  end

  def create
    @property = Property.new property_params
    @property.user = current_user

    if @property.save

      5.times do |i|
        unless params["photos#{i}"] == "" || params["photos#{i}"].nil?
          Photo.new({:file => upload_photo(params["photos#{i}"], i),
                     :property => @property}).save
        end
      end

      redirect_to action: 'index' #TODO do something more logical instead
    else
      puts @property.errors.full_messages
      render 'new'
    end
  end

  def edit

  end

  def index
    if current_user.is_role_by_name?("owner")
      success = owner_index
    else
      success = customer_index
    end

    @properties = Property.all
    @properties = @properties.paginate(page: params[:page])

    if success
      render 'index'
    else
      render 'common/error'
    end
      
  end

  def search
    if(current_user.is_role_by_name?("customer") ||
       current_user.is_role_by_name?("admin"))
      @search_params = SearchParams.new
      render 'search'
    else
      render 'common/error'
    end
  end

  def destroy 
    prop = Property.find(params[:id])
    prop.deleted = true
    prop.save
    flash[:notice] = "Property successfully deleted"
    redirect_to properties_path
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

  def ensure_authorized
    unless(current_user.is_role_by_name?("admin") ||
           current_user.is_role_by_name?("owner"))
      render 'common/not_authorized'
    end
  end

  def upload_photo file_io, index
    file_name = Rails.root.join('public', 'uploads', @property.id.to_s)

    FileUtils::mkdir_p file_name

    file_name = file_name.join(file_io.original_filename)
    File.open(file_name, 'wb') do |file|
      file.write(file_io.read)
    end

    return file_name.to_s
  end

  def owner_index
    @properties = Property.where(":user_id = ?", current_user.id)

    return true
  end

  def customer_index
    @properties = Property.where("deleted != ?", true)
    
    if has_filters?
      @properties = filter_properties(@properties, params[:search])
      return true
    else
      flash[:notice] = "Error, no search terms entered"
      return false
    end
  end

  def has_filters?
    search_params = params[:search]

    result = false

    search_params['locations'].each do |loc|
      result = true unless loc == ""
    end

    search_params['types'].each do |loc|
      result = true unless loc == ""
    end

    result = true unless search_params["number_bedrooms"] == ""
    result = true unless search_params["number_bathrooms"] == ""
    result = true unless search_params["min_rent"] == ""
    result = true unless search_params["max_rent"] == ""

    result
  end
end
