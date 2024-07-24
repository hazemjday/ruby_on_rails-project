class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:adminshow, :admin] 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_homes_path 
    else
     homes_path 
    end
  end

  private

  def authenticate_admin!
    redirect_to homes_path, alert: "Vous n'avez pas l'autorisation d'accéder à cette page." unless current_user&.admin?
  end
end
