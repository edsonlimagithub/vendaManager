class ItemKitsController < ApplicationController
  # GET /item_kits
  # GET /item_kits.json
  def index
    @item_kits = ItemKit.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_kits }
    end
  end

  # GET /item_kits/1
  # GET /item_kits/1.json
  def show
    @item_kit = ItemKit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_kit }
    end
  end

  # GET /item_kits/new
  # GET /item_kits/new.json
  def new
    @item_kit = ItemKit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_kit }
    end
  end

  # GET /item_kits/1/edit
  def edit
    @item_kit = ItemKit.find(params[:id])
  end

  # POST /item_kits
  # POST /item_kits.json
  def create
    @item_kit = ItemKit.new(params[:item_kit])
    @item_kit.empresa = session[:usuario].empresa
    respond_to do |format|
      if @item_kit.save
        format.html { redirect_to @item_kit, notice: 'Item kit was successfully created.' }
        format.json { render json: @item_kit, status: :created, location: @item_kit }
      else
        format.html { render action: "new" }
        format.json { render json: @item_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_kits/1
  # PUT /item_kits/1.json
  def update
    @item_kit = ItemKit.find(params[:id])

    respond_to do |format|
      if @item_kit.update_attributes(params[:item_kit])
        format.html { redirect_to @item_kit, notice: 'Item kit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_kits/1
  # DELETE /item_kits/1.json
  def destroy
    @item_kit = ItemKit.find(params[:id])
    @item_kit.destroy

    respond_to do |format|
      format.html { redirect_to item_kits_url }
      format.json { head :ok }
    end
  end


	def inserir_produto_kit
		id = params[:id]
		quantidade = params[:quantidade]
		@item = {:id => id, :quantidade => quantidade}
	
		if session[:items].nil?
			session[:items] = Array.new
			session[:items] << @item	
		else
			session[:items] << @item
		end
		redirect_to '/kits/new'
	end
	
	def excluir_item_kit
		id = params[:id]
		session[:items].each_with_index do |item, i|
			puts i
			if item[:id] == id
				session[:items].delete_at(i)
			end
		end
		redirect_to '/kits/new'
	end
end
