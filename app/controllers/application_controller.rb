class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#only accessed on devise controller, saves resources as will only run when devise
before_action :configure_permitted_paramters, if: :devise_controller?

# to protect the db
# on the signup page you can pass this variables back, in the furture we dont want users chaning their username
#THEY COULD  modify the username and get access

protected
def configure_permitted_paramters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
end

end
