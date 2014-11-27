class VisitsController < ApplicationController
  #TODO only allow users to do things here

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    #TODO set customer association

    if @visit.save
      #TODO
    else
      #TODO
    end
  end

  #lists the visits and properties for the current user
  def list
    #TODO set visits to an array of visits that are associated with the current user
  end

  def visit_params
    params.require(:visit).permit(:date, :time)
  end
end
