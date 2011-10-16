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

ActiveRecord::Schema.define(:version => 20111015044539) do

  create_table "buffs", :force => true do |t|
    t.integer  "player_id"
    t.string   "type",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "command_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "command_groups_players", :id => false, :force => true do |t|
    t.integer "player_id"
    t.integer "command_group_id"
  end

  create_table "command_names", :force => true do |t|
    t.integer  "command_id"
    t.integer  "command_group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "command_names", ["command_group_id"], :name => "index_on_command_group"
  add_index "command_names", ["command_id"], :name => "index_on_command"
  add_index "command_names", ["name"], :name => "index_on_name", :unique => true

  create_table "commands", :force => true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exits", :force => true do |t|
    t.string   "direction"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exits", ["origin_id", "direction"], :name => "index_exits_on_origin_id_and_direction", :unique => true

  create_table "items", :force => true do |t|
    t.integer "owner_id",   :null => false
    t.string  "owner_type", :null => false
    t.string  "type",       :null => false
  end

  create_table "mobiles", :force => true do |t|
    t.string   "type",       :null => false
    t.integer  "room_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mobiles", ["type"], :name => "index_mobiles_on_type"

  create_table "players", :force => true do |t|
    t.string  "name",           :null => false
    t.string  "password_hash"
    t.string  "password_salt"
    t.string  "pending_output"
    t.boolean "logging_out"
    t.integer "room_id",        :null => false
    t.text    "colors",         :null => false
  end

  add_index "players", ["name"], :name => "index_players_on_name"

  create_table "rat_details", :force => true do |t|
    t.integer  "rat_id"
    t.integer  "toughness",  :default => 15, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rat_details", ["rat_id"], :name => "index_rat_details_on_rat_id", :unique => true

  create_table "rooms", :force => true do |t|
    t.string "name", :null => false
    t.string "desc"
  end

  add_index "rooms", ["name"], :name => "index_rooms_on_name"

end
