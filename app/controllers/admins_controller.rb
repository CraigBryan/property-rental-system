class AdminsController < ApplicationController
  before_action :deny_access_for_non_admins
  
  def new_user_by_admin
    if params[:user].nil?
   	  @user = User.new 
    else
      @user = User.new user
    end 
  end

  def create_user_by_admin
  	@user = User.new(user)
    @user.add_role_by_name(Role.find(params[:role][:roles]).name)
    
    @user.valid?


    user_name_exist = User.exists? user_name: params[:user][:user_name]
    password_match = params[:user][:password] != params[:user][:password_confirmation]

    prefix = ['Oh Snap!', 'Holy Moly!', 'Jeepers!', 'Gosh Darnit!'].sample

    case 
    when user_name_exist && password_match
      flash[:unsuccessful_signup] = prefix << " That username is already taken and you're passwords don't match"
      render :new_user_by_admin
    when user_name_exist
      flash[:unsuccessful_signup] = prefix << " That username is already taken."
      render :new_user_by_admin
    when password_match
      flash[:unsuccessful_signup] = prefix << " You're passwords don't match."
      render :new_user_by_admin
    when @user.save
      flash[:successful_signup] = prefix << " Account created!"
      redirect_to root_path
    else
      flash[:unsuccessful_signup] = prefix << " Fix up your form"
      render :new_user_by_admin
    end

  end

  private
  def user
    params.require(:user).permit(*user_attributes)
  end
  def user_attributes
      [:user_name, :email, :first_name, :last_name, :max_rent, :password, :password_confirmation]
  end
  
end
