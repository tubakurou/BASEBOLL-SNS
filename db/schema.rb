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

ActiveRecord::Schema.define(version: 2022_02_12_170008) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "game_id", null: false
    t.boolean "after_status", default: false, null: false
    t.boolean "attack_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_cards_on_game_id"
    t.index ["team_id"], name: "index_cards_on_team_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followerd_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["followerd_id"], name: "index_followers_on_followerd_id"
  end

  create_table "games", force: :cascade do |t|
    t.date "game_day", null: false
    t.string "stadium"
    t.string "game_show"
    t.boolean "game_status", default: false, null: false
    t.integer "strike", default: 0, null: false
    t.integer "boll", default: 0, null: false
    t.integer "out", default: 0, null: false
    t.string "result_show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "goods_image_id"
    t.string "goods_name", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_goods_on_team_id"
  end

  create_table "innings", force: :cascade do |t|
    t.string "inning_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "comment_id", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "player_innings", force: :cascade do |t|
    t.integer "inning_id", null: false
    t.integer "player_result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inning_id"], name: "index_player_innings_on_inning_id"
    t.index ["player_result_id"], name: "index_player_innings_on_player_result_id"
  end

  create_table "player_results", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "player_id", null: false
    t.integer "conced", default: 0, null: false
    t.integer "pitch_boll", default: 0, null: false
    t.integer "result_info"
    t.integer "order_status", default: 0, null: false
    t.boolean "position_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_player_results_on_game_id"
    t.index ["player_id"], name: "index_player_results_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "player_image_id"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "number", null: false
    t.string "dominant_pitch", null: false
    t.string "dominant_bat", null: false
    t.boolean "play_status", default: false, null: false
    t.integer "order_status", default: 0, null: false
    t.integer "position_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "run_status", default: 0, null: false
    t.boolean "is_batting", default: false, null: false
    t.integer "inning"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "team_innings", force: :cascade do |t|
    t.integer "inning_id", null: false
    t.integer "team_result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inning_id"], name: "index_team_innings_on_inning_id"
    t.index ["team_result_id"], name: "index_team_innings_on_team_result_id"
  end

  create_table "team_results", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "game_id", null: false
    t.integer "error", default: 0, null: false
    t.integer "score", default: 0, null: false
    t.integer "hit", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_team_results_on_game_id"
    t.index ["team_id"], name: "index_team_results_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_image_id"
    t.string "team_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "team_id"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "profile"
    t.integer "fan_team"
    t.string "user_image_id"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

end
