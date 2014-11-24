class VisitsController < ApplicationController
  before_action :check_user_type, only: :list

  #lists the visits and properties for the current user
  def list
    #TODO set visits to an array of visits that are associated with the current user
  end

  private
  def check_user_type
    #TODO check session for user type (should be customer)
    #TODO redirect if necessary
  end
end
