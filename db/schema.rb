
ActiveRecord::Schema.define(version: 20210410231135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "machine_snacks", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "snack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_snacks_on_machine_id"
    t.index ["snack_id"], name: "index_machine_snacks_on_snack_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "location"
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_machines_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "machine_snacks", "machines"
  add_foreign_key "machine_snacks", "snacks"
  add_foreign_key "machines", "owners"
end
