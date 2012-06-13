class RotaItemsController < ApplicationController
  # GET /rota_items
  # GET /rota_items.json
  def index
    @rota_items = RotaItem.afind(:all, :conditions => ["empresa = ?", session[:usuario].empresa])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rota_items }
    end
  end

  # GET /rota_items/1
  # GET /rota_items/1.json
  def show
    @rota_item = RotaItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rota_item }
    end
  end

  # GET /rota_items/new
  # GET /rota_items/new.json
  def new
    @rota_item = RotaItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rota_item }
    end
  end

  # GET /rota_items/1/edit
  def edit
    @rota_item = RotaItem.find(params[:id])
  end

  # POST /rota_items
  # POST /rota_items.json
  def create
    @rota_item = RotaItem.new(params[:rota_item])
    @rota_item.empresa = session[:usuario].empresa
    respond_to do |format|
      if @rota_item.save
        format.html { redirect_to @rota_item, notice: 'Rota item was successfully created.' }
        format.json { render json: @rota_item, status: :created, location: @rota_item }
      else
        format.html { render action: "new" }
        format.json { render json: @rota_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rota_items/1
  # PUT /rota_items/1.json
  def update
    @rota_item = RotaItem.find(params[:id])

    respond_to do |format|
      if @rota_item.update_attributes(params[:rota_item])
        format.html { redirect_to @rota_item, notice: 'Rota item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rota_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rota_items/1
  # DELETE /rota_items/1.json
  def destroy
    @rota_item = RotaItem.find(params[:id])
    @rota_item.destroy

    respond_to do |format|
      format.html { redirect_to rota_items_url }
      format.json { head :ok }
    end
  end
end
