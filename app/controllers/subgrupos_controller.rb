class SubgruposController < ApplicationController
  # GET /subgrupos
  # GET /subgrupos.json
  def index
    @subgrupos = Subgrupo.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subgrupos }
    end
  end

  # GET /subgrupos/1
  # GET /subgrupos/1.json
  def show
    @subgrupo = Subgrupo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subgrupo }
    end
  end

  # GET /subgrupos/new
  # GET /subgrupos/new.json
  def new
    @subgrupo = Subgrupo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subgrupo }
    end
  end

  # GET /subgrupos/1/edit
  def edit
    @subgrupo = Subgrupo.find(params[:id])
  end

  # POST /subgrupos
  # POST /subgrupos.json
  def create
    @subgrupo = Subgrupo.new(params[:subgrupo])
    @subgrupo.empresa = session[:usuario].empresa
    respond_to do |format|
      if @subgrupo.save
        format.html { redirect_to @subgrupo, notice: 'Subgrupo was successfully created.' }
        format.json { render json: @subgrupo, status: :created, location: @subgrupo }
      else
        format.html { render action: "new" }
        format.json { render json: @subgrupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subgrupos/1
  # PUT /subgrupos/1.json
  def update
    @subgrupo = Subgrupo.find(params[:id])

    respond_to do |format|
      if @subgrupo.update_attributes(params[:subgrupo])
        format.html { redirect_to @subgrupo, notice: 'Subgrupo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @subgrupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subgrupos/1
  # DELETE /subgrupos/1.json
  def destroy
    @subgrupo = Subgrupo.find(params[:id])
    @subgrupo.destroy

    respond_to do |format|
      format.html { redirect_to subgrupos_url }
      format.json { head :ok }
    end
  end
end
