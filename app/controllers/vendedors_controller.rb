class VendedorsController < ApplicationController
  # GET /vendedors
  # GET /vendedors.json
  def index
    @vendedors = Vendedor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendedors }
    end
  end

  # GET /vendedors/1
  # GET /vendedors/1.json
  def show
    @vendedor = Vendedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendedor }
    end
  end

  # GET /vendedors/new
  # GET /vendedors/new.json
  def new
    @vendedor = Vendedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendedor }
    end
  end

  # GET /vendedors/1/edit
  def edit
    @vendedor = Vendedor.find(params[:id])
  end

  # POST /vendedors
  # POST /vendedors.json
  def create
    @vendedor = Vendedor.new(params[:vendedor])

    respond_to do |format|
      if @vendedor.save
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
        format.json { render json: @vendedor, status: :created, location: @vendedor }
      else
        format.html { render action: "new" }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendedors/1
  # PUT /vendedors/1.json
  def update
    @vendedor = Vendedor.find(params[:id])

    respond_to do |format|
      if @vendedor.update_attributes(params[:vendedor])
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedors/1
  # DELETE /vendedors/1.json
  def destroy
    @vendedor = Vendedor.find(params[:id])
    @vendedor.destroy

    respond_to do |format|
      format.html { redirect_to vendedors_url }
      format.json { head :ok }
    end
  end
end
