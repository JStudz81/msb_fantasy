# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_28_182234) do
  create_table "fantasy_teams", force: :cascade do |t|
    t.string "team_name"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchups", force: :cascade do |t|
    t.integer "team_1_id"
    t.integer "team_2_id"
    t.integer "week_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_1_id"], name: "index_matchups_on_team_1_id"
    t.index ["team_2_id"], name: "index_matchups_on_team_2_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "week_stats", force: :cascade do |t|
    t.integer "week"
    t.float "points"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fantasy_team_id"
    t.string "team"
    t.integer "batters_faced"
    t.integer "runs_allowed"
    t.integer "earned_runs"
    t.integer "batters_walked"
    t.integer "batters_hit"
    t.integer "hits_allowed"
    t.integer "hrs_allowed"
    t.integer "pitches_thrown"
    t.integer "stamina"
    t.boolean "was_pitcher"
    t.integer "star_pitches_thrown"
    t.integer "big_plays"
    t.integer "outs_pitched"
    t.string "pitches_per_position"
    t.string "batter_outs_per_position"
    t.string "outs_per_position"
    t.string "fielding_errors"
    t.integer "strikouts_pitched"
    t.float "batting_avg"
    t.integer "at_bats"
    t.integer "hits"
    t.integer "singles"
    t.integer "doubles"
    t.integer "triples"
    t.integer "homeruns"
    t.integer "successful_bunts"
    t.integer "sac_flys"
    t.integer "strikeouts"
    t.integer "walks_balls"
    t.integer "walks_hit"
    t.integer "rbi"
    t.integer "bases_stolen"
    t.integer "star_hits"
    t.integer "runs_while_on_base"
    t.index ["fantasy_team_id"], name: "index_week_stats_on_fantasy_team_id"
    t.index ["player_id"], name: "index_week_stats_on_player_id"
  end

  add_foreign_key "matchups", "team_1s"
  add_foreign_key "matchups", "team_2s"
  add_foreign_key "week_stats", "fantasy_teams"
  add_foreign_key "week_stats", "players"
end
