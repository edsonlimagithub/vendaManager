require 'rubygems'
require 'json'

class KitsController < ApplicationController
  # GET /kits
  # GET /kits.json
  def index
    @kits = Kit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kits }
    end
  end

  # GET /kits/1
  # GET /kits/1.json
  def show
    @kit = Kit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kit }
    end
  end

  # GET /kits/new
  # GET /kits/new.json
  def new
    @kit = Kit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kit }
    end
  end

  # GET /kits/1/edit
  def edit
    @kit = Kit.find(params[:id])
  end

  # POST /kits
  # POST /kits.json
  def create
    @kit = Kit.new(params[:kit])
puts "CHEGOU NO KIT"

    respond_to do |format|
      if @kit.save
        format.html { redirect_to @kit, notice: 'Kit was successfully created.' }
        format.json { render json: @kit, status: :created, location: @kit }
      else
        format.html { render action: "new" }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kits/1
  # PUT /kits/1.json
  def update
    @kit = Kit.find(params[:id])

    respond_to do |format|
      if @kit.update_attributes(params[:kit])
        format.html { redirect_to @kit, notice: 'Kit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kits/1
  # DELETE /kits/1.json
  def destroy
    @kit = Kit.find(params[:id])
    @kit.destroy

    respond_to do |format|
      format.html { redirect_to kits_url }
      format.json { head :ok }
    end
  end

	def novo
	  session[:items] = nil  
		item = params[:items]
		descricao = params[:descricao]
		preco_venda = params[:preco_venda]
		
		kit = Kit.new
    kit.descricao   = descricao
    kit.preco_venda = preco_venda
    id_kit = kit.save
		
		items = item.split("|")
		items.each do |e|
		  campo = e.split("_") 
		  campo[0] #id
		  campo[1] #quantidade
		  itemKit = ItemKit.new
		  itemKit.produto_id = campo[0]
		  itemKit.quantidade = campo[1]
		  itemKit.kit_id     = id_kit
		  itemKit.save
		end
		render :nothing => true
	end
	
	def pesquisa_kit
    #render :layout => false
  end
  
  def localiza_kit  
    @kit = nil
    @kit = Kit.find(:all, :conditions => ["descricao LIKE ?", params[:descricao]+ "%"])
    render :json => @kit.to_json
  end
  
  def inserir_kit_rota
    id = params[:id]
    @item = {:id => id}
  
    if session[:items_rota].nil?
      session[:items_rota] = Array.new
      session[:items_rota] << @item  
    else
      session[:items_rota] << @item
    end
    redirect_to '/rota/new'
  end
  
  def excluir_item_kit
    id = params[:id]
    session[:items_rota].each_with_index do |item, i|
      if item[:id] == id
        session[:items_rota].delete_at(i)
      end
    end
    redirect_to '/rota/new'
  end
  
  def pesquisa_brinde
    render :nothing => false
  end  
    
  def inserir_brinde_rota
    id = params[:id]
    @item = {:id => id}
  
    if session[:items_brinde].nil?
      session[:items_brinde] = Array.new
      session[:items_brinde] << @item  
    else
      session[:items_brinde] << @item
    end
    redirect_to '/rota/new'
  end
  
  def excluir_item_brinde
    id = params[:id]
    session[:items_brinde].each_with_index do |item, i|
      if item[:id] == id
        session[:items_brinde].delete_at(i)
      end
    end
    redirect_to '/rota/new'
  end
end
