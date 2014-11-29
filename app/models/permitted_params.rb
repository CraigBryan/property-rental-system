class PermittedParams < Struct.new(:params, :current_user)
  def user
    params.require(:user).permit(*user_attributes)
  end
  def user_attributes
      [ :email,:password, :password_confirmation, :role ]
  end
end