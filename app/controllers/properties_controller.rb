require 'fileutils'

class PropertiesController < ApplicationController
  include FilterHelper
  before_action :ensure_authorized, :only => [:new, :create, :destroy]

  def new
    @property = Property.new
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
    @property = Property.find(params[:id])
    @photos = Photo.where("property_id = ?", @property.id)
  end

  def update
    @property = Property.find(params[:id])

    #update direct property values
    @property.number_bedrooms = property_params[:number_bedrooms]
    @property.number_bathrooms = property_params[:number_bathrooms]
    @property.number_other_rooms = property_params[:number_other_rooms]
    @property.rent_price = property_params[:rent_price]

    #update photo values
    5.times do |i|
      photo_params = parse_photo_params(i)

      if photo_params[:deleted]
        delete_original photo_params[:original_id]
      end

      if photo_params[:changed]

        unless photo_params[:original_id].nil? || 
               photo_params[:original_id] == ""
          delete_original photo_params[:original_id]
        end

        p = Photo.new
        p.property_id = params[:id]
        p.file = upload_photo photo_params[:new_file], i
        p.save
      end
    end

    @property.save

    redirect_to properties_path
  end

  def index
    if current_user.is_role_by_name?("owner")
      success = owner_index
    else
      success = customer_index
    end

    @properties = Property.all

    @properties = @properties.paginate(page: params[:page])
    @photos = {}

    @properties.each do |prop|
      property_photo = []
      Photo.where("property_id = ?", prop.id).each do |photo|
        property_photo.push(photo.file)
      end
      @photos[prop.id] = property_photo
    end

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
    photo_name = "uploads/" + @property.id.to_s
    file_name = Rails.root.join('app', 'assets', 'images', photo_name)

    FileUtils::mkdir_p file_name

    photo_name = photo_name + "/" + index.to_s + "_" + file_io.original_filename
    file_name = file_name.join(index.to_s + "_" + file_io.original_filename)

    File.open(file_name, 'wb') do |file|
      file.write(file_io.read)
    end

    return photo_name.to_s
  end

  def delete_original id
    p = Photo.find(id)
    delete_photo p.file
    p.destroy
  end

  def delete_photo photo_file
    FileUtils.rm(Rails.root.join('app', 'assets', 'images', photo_file))
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
      flash[:alert] = "Error, no search terms entered"
      return false
    end
  end

  def has_filters?
    search_params = params[:search]

    result = false

    return result if search_params.nil?

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

  def parse_photo_params index
    original_id = params["photos_#{index}_original_id"] 
    original_id = original_id.to_i unless original_id.nil?
    
    {
      :original_id => params["photo_#{index}_original_id"],
      :deleted => params["photo_#{index}_deleted"] == "true",
      :changed => params["photo_#{index}_changed"] == "true",
      :new_file => params["photos#{index}"]
    }
  end
end
