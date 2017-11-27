class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:active, :user_role, :major_alarm, :college_alarm, :univ_alarm, :phone_number, :major_id, :college_id, :univ_id, :username, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:active, :user_role, :major_alarm, :college_alarm, :univ_alarm, :phone_number, :major_id, :college_id, :univ_id, :username, :email, :password, :password_confirmation, :current_password)
      end
    end

end
