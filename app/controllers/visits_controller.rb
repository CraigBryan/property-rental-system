class VisitsController < ApplicationController
  before_action :ensure_customer

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user = current_user

    if @visit.save
      #TODO
    else
      #TODO render error or something
    end
  end

  #lists the visits and properties for the current user
  def list
    @visits = Visit.find_by :id, current_user.id
  end

  def visit_params
    params.require(:visit).permit(:date, :time)
  end

  private:

  def ensure_customer
    render "not_authorized" unless current_user.is_role_by_name?("customer")  
  end
end
