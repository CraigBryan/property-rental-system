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

  #Added destroy action
  def destroy
    Property.find(params[:id]).destroy
    flash[:notice] = "Property successfully destroyed"
    redirect_to properties_path
  end

  def index
    if current_user.is_role_by_name?("owner")
      owner_index
      render 'index'
    else
      customer_index
      render 'customer_index'
    end
  end

  def owner_index
    @properties = Property.where(":user_id = ?", current_user.id)

    @properties = Property.all
    @properties = Property.paginate(page: params[:page])
  end

  def customer_index
    @properties = Property.where("deleted != ?", true)
    
    if has_filters?
      @properties = filter_properties @properties, params[:search]
    end

    #TODO, if no filters, give an error
  end

  def destroy 
    prop = Property.find(params[:id]).deleted = true
    prop.save
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

  #TODO improve this for an array of empty string, maybe
  def has_filters?
    params[:search].nil?
  end
end
