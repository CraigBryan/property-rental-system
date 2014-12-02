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

    unless params[:role].nil? || params[:role][:roles] == ""
      @user.add_role_by_name(Role.find(params[:role][:roles]).name)
    end
   
    #puts @user.valid?
    #puts @user.errors.full_messages

    user_name_exist = User.exists? user_name: params[:user][:user_name]
    password_match = params[:user][:password] != params[:user][:password_confirmation]
    user_name_invalid = ((/[^0-9A-Za-z]/) =~ params[:user][:user_name])
    flash[:errors] = []
    case 
    when user_name_exist && password_match
      flash[:errors].push "That username is already taken and your passwords don't match"
      render :new_user_by_admin
    when user_name_exist
      flash[:errors].push "That username is already taken."
      render :new_user_by_admin
    when password_match
      flash[:errors].push "Your passwords don't match."
      render :new_user_by_admin
    when user_name_invalid 
      flash[:errors].push "Username can only contain letters and numbers." 
      render :new_user_by_admin
    when @user.save
      flash[:notice] = "Account created!"
      redirect_to root_path
    else
      flash[:errors].push "Ensure the username only contains numbers and letters"
      flash[:errors].push "The email must be a valid email of the type opr@opr.com"
      flash[:errors].push "A role must be selected"
      flash[:errors].push "The user's first name and last name must be specified"
      flash[:errors].push "A customer's max rent must be completed with a number greated than 0"
      flash[:errors].push "Passwords must match"
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
