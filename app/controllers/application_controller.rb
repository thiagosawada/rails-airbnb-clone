class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :complete_profile?

  def complete_profile?

    unless request.path_info.include?("users")
      if user_signed_in? && current_user.provider == "facebook" && current_user.username.blank?

        redirect_to edit_user_registration_path, alert: "É necessário preencher todos os campos para se cadastrar"


      end
    end

  end
end
