ActiveRecord::Schema[7.0].define(version: 2023_02_14_050814) do
  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
