require 'json'

class ProdutosController < ApplicationController


  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produtos }
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.json
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(params[:produto])
    @produto.empresa = session[:usuario].empresa

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render json: @produto, status: :created, location: @produto }
      else
        format.html { render action: "new" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /produtos/1
  # PUT /produtos/1.json
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to produtos_url }
      format.json { head :ok }
    end
  end

	def pesquisa_item
		#render :layout => false
	end
	
	def pesquisa_produto
	  render :layout => false
	end
	
	def localiza_produto_id
	  produto = Produto.find(params[:id]) rescue nil
      render :json => produto
	end
	
	def localiza_produto
		@produto = nil
		@produto = Produto.find(:all, :conditions => ["descricao LIKE ? and empresa = ?", params[:descricao]+ "%", session[:usuario].empresa])
		render :json => @produto.to_json
	end
	
	def pesquisa_nota_entrada
	  produto = nil
    @produto = Produto.find(:all, :conditions => ["descricao LIKE ? and empresa = ?", params[:descricao]+ "%", session[:usuario].empresa])
    ActiveRecord::Base.include_root_in_json = false
    produto_hash = []
    @produto.each do |item|
      produto_hash << {"id" => item.id, "label" => item.descricao}
    end
    render :json => produto_hash
	end
	
	def pesquisa_produto_autocomplete
    produto = nil
    @produto = Produto.find(:all, :conditions => ["descricao LIKE ? and empresa = ?", params[:term]+ "%", session[:usuario].empresa])
    ActiveRecord::Base.include_root_in_json = false
    produto_hash = []
    @produto.each do |item|
      produto_hash << {"id" => item.id, "label" => item.descricao}
    end
    render :json => produto_hash
  end
	
	
	
end
