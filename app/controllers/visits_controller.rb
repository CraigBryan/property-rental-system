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

  def index
    @visits = Visit.where("user_id = ?", current_user.id)
    @visits  = Visit.paginate(page: params[:page])
  end

  def destroy
    Visit.find(params[:id]).destroy
    flash[:notice] = "Visit successfully destroyed"
    redirect_to visits_path
  end

  private

  def visit_params
    { :date => params[:visit][:date], :time => params[:visit][:time] }
  end

  def ensure_authorized
    render "common/not_authorized" unless current_user.is_role_by_name?("customer")
  end
end
