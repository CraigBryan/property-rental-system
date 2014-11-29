class AdminsController < ApplicationController
  before_action: deny_access_for_non_admins
  
  def new_user_by_admin
   	@user = User.new
  end

  def create_user_by_admin
  	@user = User.new(user)
    @user.add_role_by_name(Role.find(params[:role][:roles]).name)
    #authorize! :manage, User
    if @user.save
     #success
    else
     #error
    end
  end

  private
  def user
    params.require(:user).permit(*user_attributes)
  end
  def user_attributes
      [:email, :first_name, :last_name, :max_rent, :password, :password_confirmation]
  end
  
end
