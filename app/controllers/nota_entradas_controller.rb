class NotaEntradasController < ApplicationController
  # GET /nota_entradas
  # GET /nota_entradas.json
  def index
    @nota_entradas = NotaEntrada.afind(:all, :conditions => ["empresa = ?", session[:usuario].empresa])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nota_entradas }
    end
  end

  # GET /nota_entradas/1
  # GET /nota_entradas/1.json
  def show
    @nota_entrada = NotaEntrada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nota_entrada }
    end
  end

  # GET /nota_entradas/new
  # GET /nota_entradas/new.json
  def new
    @nota_entrada = NotaEntrada.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nota_entrada }
    end
  end

  # GET /nota_entradas/1/edit
  def edit
    @nota_entrada = NotaEntrada.find(params[:id])
  end

  # POST /nota_entradas
  # POST /nota_entradas.json
  def create
    @nota_entrada = NotaEntrada.new(params[:nota_entrada])
    @nota_entrada.empresa = session[:usuario].empresa
    respond_to do |format|
      if @nota_entrada.save
        format.html { redirect_to @nota_entrada, notice: 'Nota entrada was successfully created.' }
        format.json { render json: @nota_entrada, status: :created, location: @nota_entrada }
      else
        format.html { render action: "new" }
        format.json { render json: @nota_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nota_entradas/1
  # PUT /nota_entradas/1.json
  def update
    @nota_entrada = NotaEntrada.find(params[:id])

    respond_to do |format|
      if @nota_entrada.update_attributes(params[:nota_entrada])
        format.html { redirect_to @nota_entrada, notice: 'Nota entrada was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @nota_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_entradas/1
  # DELETE /nota_entradas/1.json
  def destroy
    @nota_entrada = NotaEntrada.find(params[:id])
    @nota_entrada.destroy

    respond_to do |format|
      format.html { redirect_to nota_entradas_url }
      format.json { head :ok }
    end
  end
  
  def inserir_produto
    quantidade = params[:quantidade]
    produto = Produto.find(params[:id])
  end
  
  def inseri_produto_nota
    @item_nota_entrada = {:id => params[:id], :quantidade => params[:quantidade]}
    if session[:nota_entrada_itens].nil? 
      session[:nota_entrada_itens] = Array.new
      session[:nota_entrada_itens] << @item_nota_entrada
    else
      session[:nota_entrada_itens] << @item_nota_entrada
    end
    render :nothing => true
  end
  
  def exclui_produto_nota
    item_id = params[:item_id]
    session[:nota_entrada_itens].each_with_index do |item, i|
      if item[:id] == item_id
        session[:nota_entrada_itens].delete_at(i)
      end
    end
    render :nothing => true
  end
  
end
