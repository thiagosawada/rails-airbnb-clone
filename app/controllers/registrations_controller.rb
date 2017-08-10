class RegistrationsController < Devise::RegistrationsController

  private

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :about, :username, :user_city, :coach)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :about, :username, :user_city, :coach)
  end
end
