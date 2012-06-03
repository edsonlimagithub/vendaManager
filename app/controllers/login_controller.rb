class LoginController < ApplicationController
  
  def login
    render :layout => false
  end
  
  def do_login
    usuario = Usuario.find(:first, :conditions => ['login = ? and senha = ?', params[:login], params[:senha]])
    if not usuario.nil?
      session[:usuario] = usuario
      redirect_to '/home'
    else
      redirect_to '/'
    end
  end
end
