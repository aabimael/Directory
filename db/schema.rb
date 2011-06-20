# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091119034902) do

  create_table "personas", :force => true do |t|
    t.string   "nombres"
    t.string   "a_paterno"
    t.string   "a_materno"
    t.string   "empresa"
    t.string   "cargo"
    t.string   "tel_oficina"
    t.string   "tel_particular"
    t.string   "tel_movil"
    t.string   "tel_fax"
    t.string   "direc_calle"
    t.string   "direc_colonia"
    t.string   "direc_cp"
    t.string   "direc_int"
    t.string   "direc_ext"
    t.string   "direc_delegacion"
    t.string   "email"
    t.string   "pag_web"
    t.string   "notas"
    t.string   "tel_oficina_ext"
    t.string   "dia_cumple"
    t.string   "mes_cumple"
    t.string   "anio_cumple"
    t.date     "fecha_nacimiento"
    t.string   "asistente"
    t.string   "nacionalidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "password"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
