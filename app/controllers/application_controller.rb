class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #before_filter :valida_usuario
  
  # def valida_usuario
    # if session[:usuario].nil?
      # redirect_to '/do_login'
    # end
  # end
  
end
