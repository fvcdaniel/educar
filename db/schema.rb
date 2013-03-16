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

ActiveRecord::Schema.define(:version => 20130316184129) do

  create_table "assuntos", :force => true do |t|
    t.string   "nome"
    t.integer  "materia_id"
    t.integer  "assunto_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assuntos", ["assunto_id"], :name => "index_assuntos_on_assunto_id"
  add_index "assuntos", ["materia_id"], :name => "index_assuntos_on_materia_id"

  create_table "bancas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "burndowns", :force => true do |t|
    t.string   "portugues"
    t.string   "dadmin"
    t.string   "dconst"
    t.string   "computacao"
    t.string   "rlogico"
    t.integer  "dias"
    t.string   "colors"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "texto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
    t.integer  "questao_id"
    t.integer  "user_id"
  end

  add_index "comments", ["ancestry"], :name => "index_comments_on_ancestry"
  add_index "comments", ["questao_id"], :name => "index_comments_on_questao_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "concursos", :force => true do |t|
    t.string   "nome"
    t.integer  "ano"
    t.string   "cargo"
    t.string   "edital"
    t.string   "gabarito"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "banca_id"
    t.string   "prova"
  end

  create_table "itens", :force => true do |t|
    t.text     "desc"
    t.integer  "questao_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "itens", ["questao_id"], :name => "index_itens_on_questao_id"

  create_table "materias", :force => true do |t|
    t.string   "nome"
    t.string   "imagem"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questoes", :force => true do |t|
    t.integer  "materia_id"
    t.integer  "concurso_id"
    t.integer  "assunto_id"
    t.text     "texto"
    t.string   "gabarito"
    t.string   "tipo",        :default => "M"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "user_id"
  end

  add_index "questoes", ["assunto_id"], :name => "index_questoes_on_assunto_id"
  add_index "questoes", ["concurso_id"], :name => "index_questoes_on_concurso_id"
  add_index "questoes", ["materia_id"], :name => "index_questoes_on_materia_id"
  add_index "questoes", ["user_id"], :name => "index_questoes_on_user_id"

  create_table "resposta", :force => true do |t|
    t.integer  "questao_id"
    t.integer  "user_id"
    t.string   "gabarito"
    t.string   "resposta"
    t.integer  "tempo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "resposta", ["questao_id"], :name => "index_resposta_on_questao_id"
  add_index "resposta", ["user_id"], :name => "index_resposta_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
