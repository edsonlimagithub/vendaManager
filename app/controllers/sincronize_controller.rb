class SincronizeController < ApplicationController
  
  def sincronize_produtos
    @produtos = Produto.find(:all, :conditions => ["empresa = ?", params[:empresa_id]])
    render json: @produtos
  end
  
  def sincronize_clientes
    @clientes = Cliente.find(:all, :conditions => ["empresa_id = ?", params[:empresa_id]])
    render json: @clientes
  end
  
  def sincronize_usuarios
    @usuarios = Usuario.find(:all, :conditions => ["empresa = ?", params[:empresa_id]])
    render json: @usuarios
  end
  
end
