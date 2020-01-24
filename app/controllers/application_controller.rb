class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_user! 
    #before_action :verified_user
    #helper_method :current_user
  
    # private
  
    # def verified_user
    #   redirect_to '/' unless user_is_authenticated
    # end
  
    # def user_is_authenticated
    #   !!current_user
    # end
  
    # def current_user
    #   User.find_by(id: session[:user_id])
    # end
    
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    end
end
