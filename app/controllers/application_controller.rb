class ApplicationController < ActionController::Base
  before_action :configure_peemitted_parameters, if: :devise_controller?

  private

  def configure_peemitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day])
  end
end
