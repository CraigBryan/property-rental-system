class VisitsController < ApplicationController
  before_action :ensure_authorized

  #only works if a property id is in the url query string
  def new
    @visit = Visit.new
    @property = Property.find params[:property]
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user = current_user
    @visit.property = Property.find params[:visit][:property]

    if @visit.save
      redirect_to visits_path
    else
      render "common/error"
    end
  end

  #lists the visits and properties for the current user
  def index
    @visits = Visit.where("user_id = ?", current_user.id)
  end

  private

  def visit_params
    { :date => params[:visit][:date], :time => params[:visit][:time] }
  end

  def ensure_authorized
    render "common/not_authorized" unless current_user.is_role_by_name?("customer")  
  end
end
