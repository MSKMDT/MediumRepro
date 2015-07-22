class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # add_flash_types :notice, :error, :success, :alert
  protect_from_forgery with: :exception

  before_action :check_profile_exists
  skip_before_action :check_profile_exists, if: :devise_controller?

  def after_sign_in_path_for resource
     logger.debug "hello world, before if"
     if !current_user.profile
        new_profile_path
     else
         profile_path current_user.profile.id
     end
  end

  protected

  def check_profile_exists
  	if user_signed_in? && !current_user.profile 
  		redirect_to new_profile_path
  	end
  end
end
