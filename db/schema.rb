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

ActiveRecord::Schema.define(:version => 20140123225550) do

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "contato"
    t.string   "telefone"
    t.string   "email"
    t.text     "observacao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "cnpj"
  end

  create_table "indicacaos", :force => true do |t|
    t.date     "data"
    t.integer  "user_id"
    t.integer  "cliente_id"
    t.integer  "servico_id"
    t.text     "detalhes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "concluida"
    t.float    "valor_fechamento"
    t.float    "valor_comissao"
    t.boolean  "cancelado"
  end

  create_table "roles", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servicos", :force => true do |t|
    t.string   "descricao"
    t.float    "porcentagem"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "detalhes"
    t.integer  "dias_acompanhamento"
    t.string   "email"
    t.float    "comissao_valor"
  end

  create_table "setors", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role_id"
    t.integer  "setor_id"
    t.string   "telefone"
    t.string   "nome"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
