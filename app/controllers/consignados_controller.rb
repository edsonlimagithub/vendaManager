class ConsignadosController < ApplicationController
  # GET /consignados
  # GET /consignados.json
  def index
    @consignados = Consignado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consignados }
    end
  end

  # GET /consignados/1
  # GET /consignados/1.json
  def show
    @consignado = Consignado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consignado }
    end
  end

  # GET /consignados/new
  # GET /consignados/new.json
  def new
    @consignado = Consignado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consignado }
    end
  end

  # GET /consignados/1/edit
  def edit
    @consignado = Consignado.find(params[:id])
  end

  # POST /consignados
  # POST /consignados.json
  def create
    @consignado = Consignado.new(params[:consignado])

    respond_to do |format|
      if @consignado.save
        format.html { redirect_to @consignado, notice: 'Consignado was successfully created.' }
        format.json { render json: @consignado, status: :created, location: @consignado }
      else
        format.html { render action: "new" }
        format.json { render json: @consignado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consignados/1
  # PUT /consignados/1.json
  def update
    @consignado = Consignado.find(params[:id])

    respond_to do |format|
      if @consignado.update_attributes(params[:consignado])
        format.html { redirect_to @consignado, notice: 'Consignado was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @consignado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consignados/1
  # DELETE /consignados/1.json
  def destroy
    @consignado = Consignado.find(params[:id])
    @consignado.destroy

    respond_to do |format|
      format.html { redirect_to consignados_url }
      format.json { head :ok }
    end
  end
end
