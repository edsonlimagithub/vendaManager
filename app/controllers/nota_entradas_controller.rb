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
    @fornecedores_nota_entrada = Fornecedor.find(:all, :conditions => [" empresa = ?", session[:usuario].empresa])

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
#data_emissao, data_entrada, fornecedor_id, nota_numero, valor_despesas, valor_produtos
    session[:nota_entrada_cabecalho] ||= Hash.new
    session[:nota_entrada_cabecalho][:data_emissao]   = params[:data_emissao]
    session[:nota_entrada_cabecalho][:data_entrada]   = params[:data_entrada]
    session[:nota_entrada_cabecalho][:fornecedor_id]  = params[:fornecedor_id]
    session[:nota_entrada_cabecalho][:nota_numero]    = params[:nota_numero]
    session[:nota_entrada_cabecalho][:valor_despesas] = params[:valor_despesas]
    session[:nota_entrada_cabecalho][:valor_produtos] = params[:valor_produtos]
    puts "Valores da sessao: #{session[:nota_entrada_cabecalho]}"
    item_nota_entrada = {:id => params[:id], :quantidade => params[:quantidade], :valor_unitario => params[:valor_unitario]}
    if session[:nota_entrada_itens].nil? 
      session[:nota_entrada_itens] = Array.new
      session[:nota_entrada_itens] << item_nota_entrada
    else
      session[:nota_entrada_itens].each do |e|
        if e[:id] == params[:id]
          e[:quantidade] = params[:quantidade]
          e[:valor_unitario] = params[:valor_unitario]
        else
          session[:nota_entrada_itens] << item_nota_entrada
        end
      end
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
  
  def fecha_nota_entrada
    nota_entrada = NotaEntrada.new
    nota_entrada.numero         = session[:nota_entrada_cabecalho][:nota_numero]
    nota_entrada.data_emissao   = session[:nota_entrada_cabecalho][:data_emissao]
    nota_entrada.data_entrada   = session[:nota_entrada_cabecalho][:data_entrada]
    nota_entrada.fornecedor     = session[:nota_entrada_cabecalho][:fornecedor_id]
    nota_entrada.valor_produtos = session[:nota_entrada_cabecalho][:valor_produtos]
    nota_entrada.valor_despesas = session[:nota_entrada_cabecalho][:valor_despesas]
    nota_entrada.empresa = session[:usuario].empresa
    #nota_entrada.save
    session[:nota_entrada_itens].each do |item|
      item_nota = ItemNotaEntrada.new
      item_nota.produto = item[:id]
      item_nota.nota = nota_entrada.id
      item_nota.quantidade = item[:quantidade]
      item_nota.valor_unitario = item[:valor_unitario]
      if item_nota.save
        produto = Produto.find(item_nota.produto)
        if produto.estoque_interno.nil?
          produto.estoque_interno = 0
        end
        produto.estoque_interno = produto.estoque_interno  + item[:quantidade].to_f
        produto.save
      end
    end
    flash[:notice] = "Nota finalizada com sucesso!"
  end
  
end
