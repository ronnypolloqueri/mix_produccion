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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131215133928) do

  create_table "archivos", force: true do |t|
    t.string   "nombre"
    t.integer  "num_de_dias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produccion_diaria", force: true do |t|
    t.decimal  "cantidad"
    t.integer  "producto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produccion_diaria", ["producto_id"], name: "index_produccion_diaria_on_producto_id"

  create_table "productos", force: true do |t|
    t.string   "nombre"
    t.integer  "archivo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productos", ["archivo_id"], name: "index_productos_on_archivo_id"

  create_table "variables_de_produccion", force: true do |t|
    t.string   "nombre"
    t.integer  "producto_id"
    t.decimal  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variables_de_produccion", ["producto_id"], name: "index_variables_de_produccion_on_producto_id"

end
