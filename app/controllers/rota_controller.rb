require 'rota/pesquisa_rota'
require 'rota/processa_rota'
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
    functionsProduct = FunctionsProduct.new
    @rotum = Rotum.new(:empresa => session[:usuario].empresa, 
                       :cidade_id => params[:cidade][:id],
                       :vendedor_id => params[:vendedor][:id],
                       :observacao => params[:observacao],
                       :rota_numero => params[:rota][:numero]
                        )
    chave = nil
    valor = nil
    begin
      @rotum.save
      params.each do |key, value|
        chave = key
        valor = value
        if chave["quantidade"]
           chave = key.split("_")
          if chave[1] == "kit"
            rota_item = RotaItem.new
            rota_item.rota_id    = @rotum.id
            rota_item.item_id    = chave[2]
            rota_item.quantidade = value
            rota_item.tipo_item  = 1 #valor 1 indica que é um kit 
            rota_item.empresa    = session[:usuario].empresa
            rota_item.save
            itemKit = ItemKit.find(:all, :conditions => ["kit_id = ?", rota_item.item_id])
            itemKit.each do |item|
              functionsProduct.decreaseAmountStockInternal item[:produto_id], item[:quantidade] * value.to_f
              functionsProduct.addAmountStockExternal item[:produto_id], item[:quantidade] * value.to_f
            end
          end
          if chave[1] == "brinde"
            rota_item = RotaItem.new
            rota_item[:rota_id]    = @rotum.id
            rota_item[:item_id]    = chave[2]
            rota_item[:quantidade] = value
            rota_item[:tipo_item]  = 2 #valor 2 indicar que é um brinde
            rota_item[:empresa]    = session[:usuario].empresa
            rota_item.save
            functionsProduct.decreaseAmountStockInternal rota_item[:item_id], rota_item[:quantidade] 
            functionsProduct.addAmountStockExternal rota_item[:item_id], rota_item[:quantidade] 
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
  
  # def nova
    # rota = Rotum.new
    # rota.cidade_id   = params[:cidade]
    # rota.vendedor_id = params[:vendedor]
    # brindes          = params[:brindes].split("|")
    # kits             = params[:kits].split("|")
    # rota.save
    # kits.each do|e|
      # rotaItem = RotaItem.new
      # elemento_array      = e.split("_")
      # rotaItem.rota_id    = rota.id
      # rotaItem.item_id    = elemento_array[0]
      # rotaItem.quantidade = elemento_array[1]
      # rotaItem.tipo_item  = 1 #Indica que o elemento é um kit
      # rotaItem.save
#       
#       
    # end
#     
    # brindes.each do|e|
      # rotaItem = RotaItem.new
      # elemento_array      = e.split("_")
      # rotaItem.rota_id    = rota.id
      # rotaItem.item_id    = elemento_array[0]
      # rotaItem.quantidade = elemento_array[1]
      # rotaItem.tipo_item  = 2 #Indica que o elemento é um brinde
      # rotaItem.save
      # FunctionsProduct.decreaseAmountStockInternal rotaItem.item_id, rotaItem.quantidade
      # FunctionsProduct.addAmountStockExternal rotaItem.item_id, rotaItem.quantidade
    # end
#     
#     
    # render :nothing => true
  # end
  
  def retorno_conferencia
    @rotas = Rotum.find(:all, :conditions => ["data_retorno is null AND empresa = ? AND inativa is not true" , session[:usuario].empresa])
  end
  
  def retorno_conferencia_result    
    @rotaKits    = RotaItem.find(:all, :conditions => ["rota_id = ? AND tipo_item = 1", params[:id]])
    @rotaBrindes = RotaItem.find(:all, :conditions => ["rota_id = ? AND tipo_item = 2", params[:id]])
  end
  
  def retorno_rota
    @rotas = Rotum.find(:all, :conditions => ["data_retorno is null AND empresa = ? AND inativa is not true", session[:usuario].empresa])
  end
  
  def retorno_rota_result
    @rotaKits    = RotaItem.find(:all, :conditions => ["rota_id = ? AND tipo_item = 1", params[:id]])
    @rotaBrindes = RotaItem.find(:all, :conditions => ["rota_id = ? AND tipo_item = 2", params[:id]])
  end
  
  def processa_retorno_rota
    ProcessaRota.retorno params
  end
  
  def processa_conferencia
    ProcessaRota.conferencia
    abort params.inspect
  end
  
end
