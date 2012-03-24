# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120318024337) do

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "rg"
    t.string   "logradouro"
    t.string   "caixa_postal"
    t.string   "cidade"
    t.string   "bairro"
    t.string   "uf"
    t.string   "telefone1"
    t.string   "telefone2"
    t.binary   "desativado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consignados", :force => true do |t|
    t.integer  "cliente_id"
    t.datetime "data"
    t.datetime "proxima_cobranca"
    t.integer  "prazo_dias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_consignados", :force => true do |t|
    t.integer  "produto_id"
    t.integer  "consignado_id"
    t.float    "quantidade_produto"
    t.float    "quantidade_kit"
    t.integer  "kit_id"
    t.binary   "cobrado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_kits", :force => true do |t|
    t.integer  "produto_id"
    t.integer  "kit_id"
    t.float    "quantidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_nota_entradas", :force => true do |t|
    t.integer  "produto"
    t.integer  "nota"
    t.float    "quantidade"
    t.float    "valor_unitario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kits", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "preco_venda"
  end

  create_table "nota_entradas", :force => true do |t|
    t.string   "numero"
    t.date     "data_emissao"
    t.date     "data_entrada"
    t.integer  "fornecedor"
    t.float    "valor_produtos"
    t.float    "valor_despesas"
    t.float    "valor_total"
    t.integer  "filial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.string   "descricao"
    t.integer  "grupo_id"
    t.integer  "subgrupo_id"
    t.float    "preco_compra"
    t.float    "preco_venda"
    t.binary   "desativado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rota", :force => true do |t|
    t.integer  "cidade_id"
    t.integer  "vendedor_id"
    t.string   "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data"
  end

  create_table "rota_items", :force => true do |t|
    t.integer  "rota_id"
    t.integer  "item_id"
    t.float    "quantidade"
    t.integer  "tipo_item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subgrupos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "login"
    t.string   "senha"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendedors", :force => true do |t|
    t.string   "nome"
    t.string   "telefone1"
    t.string   "telefone2"
    t.binary   "desativado"
    t.string   "logradouro"
    t.string   "caixa_postal"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
