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

ActiveRecord::Schema.define(version: 20170127113303) do

  create_table "admins", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.boolean  "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "affiliation"
    t.string   "photo"
    t.text     "descriptif"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tours", force: :cascade do |t|
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "encrypted_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "postal"
    t.integer  "bureau"
    t.boolean  "tour1"
    t.boolean  "tour2"
    t.boolean  "active"
    t.string   "forname"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "id_candidate"
    t.integer  "code_postal"
    t.integer  "bureau_de_vote"
    t.integer  "id_tour"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "vote_validation"
  end

end
