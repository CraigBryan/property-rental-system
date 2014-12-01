class AdminsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
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
    user_name_invalid = params[:user_name].to_s =~ (/[^a-zA-Z0-9]/)

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
    when user_name_invalid
      flash[:invalid_username] = prefix << " Usernames can only contain letters and numbers." 
      render :new_user_by_admin
    when @user.save
      flash[:successful_signup] = prefix << " Account created!"
      redirect_to root_path
    else
      flash[:unsuccessful_signup] = prefix << " Fix up your form"
      render :new_user_by_admin
    end

  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  private
  def user
    params.require(:user).permit(*user_attributes)
  end
  def user_attributes
      [:user_name, :email, :first_name, :last_name, :max_rent, :password, :password_confirmation]
  end
  
end
