#enconding: utf-8

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
      flash[:error] = "Usuario ou senha invalidos."
      redirect_to '/'
    end
  end
end