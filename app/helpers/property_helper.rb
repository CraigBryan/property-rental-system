module PropertyHelper
  def pass_params sort_param
    return {:sort_by => sort_param, :search => @search_params}
  end
end
