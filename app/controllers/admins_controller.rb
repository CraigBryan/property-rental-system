class AdminsController < ApplicationController
  def new_user_by_admin
  	authorize! :manage, User
   	@user = Users.new
  end

  def create_user_by_admin
  	@user = User.new(permitted_params.user)
    authorize! :manage, User
    if @user.save
     #success
    else
     #error
    end
  end
end
