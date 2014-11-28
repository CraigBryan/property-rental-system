class UsersController < ApplicationController
  before_action :deny_access_for_non_admins, except:[:index,:show] 
  
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save 
      redirect_to @user
    else
      # DO SOMETHING ELSE
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path #redirects to index
  end


  private

    def user_params
      params.require(:user).permit(:email,:password, :password_confirmation) 
    end

end
