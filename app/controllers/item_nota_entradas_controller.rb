class ItemNotaEntradasController < ApplicationController
  # GET /item_nota_entradas
  # GET /item_nota_entradas.json
  def index
    @item_nota_entradas = ItemNotaEntrada.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_nota_entradas }
    end
  end

  # GET /item_nota_entradas/1
  # GET /item_nota_entradas/1.json
  def show
    @item_nota_entrada = ItemNotaEntrada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_nota_entrada }
    end
  end

  # GET /item_nota_entradas/new
  # GET /item_nota_entradas/new.json
  def new
    @item_nota_entrada = ItemNotaEntrada.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_nota_entrada }
    end
  end

  # GET /item_nota_entradas/1/edit
  def edit
    @item_nota_entrada = ItemNotaEntrada.find(params[:id])
  end

  # POST /item_nota_entradas
  # POST /item_nota_entradas.json
  def create
    @item_nota_entrada = ItemNotaEntrada.new(params[:item_nota_entrada])

    respond_to do |format|
      if @item_nota_entrada.save
        format.html { redirect_to @item_nota_entrada, notice: 'Item nota entrada was successfully created.' }
        format.json { render json: @item_nota_entrada, status: :created, location: @item_nota_entrada }
      else
        format.html { render action: "new" }
        format.json { render json: @item_nota_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_nota_entradas/1
  # PUT /item_nota_entradas/1.json
  def update
    @item_nota_entrada = ItemNotaEntrada.find(params[:id])

    respond_to do |format|
      if @item_nota_entrada.update_attributes(params[:item_nota_entrada])
        format.html { redirect_to @item_nota_entrada, notice: 'Item nota entrada was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_nota_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_nota_entradas/1
  # DELETE /item_nota_entradas/1.json
  def destroy
    @item_nota_entrada = ItemNotaEntrada.find(params[:id])
    @item_nota_entrada.destroy

    respond_to do |format|
      format.html { redirect_to item_nota_entradas_url }
      format.json { head :ok }
    end
  end
end
