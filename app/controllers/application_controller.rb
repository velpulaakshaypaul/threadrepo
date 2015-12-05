
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
    devise_parameter_sanitizer.for(:sign_up) << :contact
    devise_parameter_sanitizer.for(:account_update) << :firstname
    devise_parameter_sanitizer.for(:account_update) << :lastname
    devise_parameter_sanitizer.for(:account_update) << :contact
  end

  private

   def after_sign_out_path_for(resource_or_scope)
        root_path
   end

   def after_sign_in_path_for(resource)
     @user = current_user
     if @user.admin?
       jobs_path(:user_email => @user.email)
     else
       pages_applicant_home_path
     end
   end
     def after_sign_up_path_for(resource)
       new_user_session_path
     end

end
