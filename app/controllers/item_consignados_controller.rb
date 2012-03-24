class ItemConsignadosController < ApplicationController
  # GET /item_consignados
  # GET /item_consignados.json
  def index
    @item_consignados = ItemConsignado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_consignados }
    end
  end

  # GET /item_consignados/1
  # GET /item_consignados/1.json
  def show
    @item_consignado = ItemConsignado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_consignado }
    end
  end

  # GET /item_consignados/new
  # GET /item_consignados/new.json
  def new
    @item_consignado = ItemConsignado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_consignado }
    end
  end

  # GET /item_consignados/1/edit
  def edit
    @item_consignado = ItemConsignado.find(params[:id])
  end

  # POST /item_consignados
  # POST /item_consignados.json
  def create
    @item_consignado = ItemConsignado.new(params[:item_consignado])

    respond_to do |format|
      if @item_consignado.save
        format.html { redirect_to @item_consignado, notice: 'Item consignado was successfully created.' }
        format.json { render json: @item_consignado, status: :created, location: @item_consignado }
      else
        format.html { render action: "new" }
        format.json { render json: @item_consignado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_consignados/1
  # PUT /item_consignados/1.json
  def update
    @item_consignado = ItemConsignado.find(params[:id])

    respond_to do |format|
      if @item_consignado.update_attributes(params[:item_consignado])
        format.html { redirect_to @item_consignado, notice: 'Item consignado was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_consignado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_consignados/1
  # DELETE /item_consignados/1.json
  def destroy
    @item_consignado = ItemConsignado.find(params[:id])
    @item_consignado.destroy

    respond_to do |format|
      format.html { redirect_to item_consignados_url }
      format.json { head :ok }
    end
  end
end
