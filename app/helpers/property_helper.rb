module PropertyHelper
  def pass_params sort_param
    return {:sort_by => sort_param, :search => @search_params}
  end

  def split_properties
    @undeleted_properties = @properties.where("deleted = ?", false)
    @deleted_properties = @properties.where("deleted = ?", true)
  end

  def owner
    current_user.is_role_by_name?("owner")
  end

  def customer
    current_user.is_role_by_name?("customer")
  end
end
