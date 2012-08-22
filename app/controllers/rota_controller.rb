require 'rota/pesquisa_rota'
require 'produtos/funcoes_produtos'
class RotaController < ApplicationController
  # GET /rota
  # GET /rota.json
  def index
    @rota = Rotum.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rota }
    end
  end

  # GET /rota/1
  # GET /rota/1.json
  def show
    @rotum = Rotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rotum }
    end
  end

  # GET /rota/new
  # GET /rota/new.json
  def new
    @rotum = Rotum.new
    @cidades = Cidade.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])
    @vendedores = Vendedor.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])
    @kits = Kit.find(:all, :conditions => ["empresa = ?", session[:usuario].empresa])
    @brindes  = Produto.find(:all, :conditions => ["empresa = ? and brinde = ?", session[:usuario].empresa, "t"])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rotum }
    end
  end

  # GET /rota/1/edit
  def edit
    @rotum = Rotum.find(params[:id])
  end

  # POST /rota
  # POST /rota.json
  def create
    @rotum = Rotum.new(:empresa => session[:usuario].empresa, 
                       :cidade_id => params[:cidade][:id],
                       :vendedor_id => params[:vendedor][:id],
                       :observacao => params[:observacao]
                        )
    chave = nil
    valor = nil
    begin
      @rotum.save
      params.each do |key, value|
        chave = key
        valor = value
        if value != ""
           chave = key.split("_")
          if chave[1] == "kit"
            rota_item = RotaItem.new
            rota_item[:rota_id]    = @rotum.id
            rota_item[:item_id]    = chave[2]
            rota_item[:quantidade] = value
            rota_item[:tipo_item]  = 1 #valor 1 indica que é um kit 
            rota_item[:empresa]    = session[:usuario].empresa
            rota_item.save
          end
          if chave[1] == "brinde"
            rota_item = RotaItem.new
            rota_item[:rota_id]    = @rotum.id
            rota_item[:item_id]    = item[2]
            rota_item[:quantidade] = value
            rota_item[:tipo_item]  = 2 #valor 2 indicar que é um brinde
            rota_item[:empresa]    = session[:usuario].empresa
            rota_item.save
          end
        end
      end
    rescue => e
      @rotum.destroy
      abort("Erro:#{e} - key:#{chave} - valor:#{valor}")
    end
    respond_to do |format|
      if @rotum.save
        format.html { redirect_to @rotum, notice: 'Rota criada com sucesso.' }
        format.json { render json: @rotum, status: :created, location: @rotum }
      else
        format.html { render action: "new" }
        format.json { render json: @rotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rota/1
  # PUT /rota/1.json
  def update
    @rotum = Rotum.find(params[:id])

    respond_to do |format|
      if @rotum.update_attributes(params[:rotum])
        format.html { redirect_to @rotum, notice: 'Rotum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rota/1
  # DELETE /rota/1.json
  def destroy
    @rotum = Rotum.find(params[:id])
    @rotum.destroy

    respond_to do |format|
      format.html { redirect_to rota_url }
      format.json { head :ok }
    end
  end
  
  def nova
    rota = Rotum.new
    rota.cidade_id   = params[:cidade]
    rota.vendedor_id = params[:vendedor]
    brindes          = params[:brindes].split("|")
    kits             = params[:kits].split("|")
    rota.save
    kits.each do|e|
      rotaItem = RotaItem.new
      elemento_array      = e.split("_")
      rotaItem.rota_id    = rota.id
      rotaItem.item_id    = elemento_array[0]
      rotaItem.quantidade = elemento_array[1]
      rotaItem.tipo_item  = 1 #Indica que o elemento é um kit
      rotaItem.save
      FunctionsProduct.decreaseAmountStockInternal rotaItem.id, rotaItem.quantidade
      FunctionsProduct.addAmountStockExternal rotaItem.id, rotaItem.quantidade
    end
    
    brindes.each do|e|
      rotaItem = RotaItem.new
      elemento_array      = e.split("_")
      rotaItem.rota_id    = rota.id
      rotaItem.item_id    = elemento_array[0]
      rotaItem.quantidade = elemento_array[1]
      rotaItem.tipo_item  = 2 #Indica que o elemento é um brinde
      rotaItem.save
    end
    
    
    render :nothing => true
  end
  
  def retorno_conferencia
    @rotas = Rotum.find(:all, :conditions => ["data_retorno is null AND empresa = ?", session[:usuario].empresa])
  end
  
  def retorno_conferencia_result    
  end
  
end
