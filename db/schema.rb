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

ActiveRecord::Schema[8.0].define(version: 2025_12_02_225112) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "design_iconography_iconifications", force: :cascade do |t|
    t.string "iconified_type", null: false
    t.integer "iconified_id", null: false
    t.integer "icon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icon_id"], name: "index_design_iconography_iconifications_on_icon_id"
    t.index ["iconified_type", "iconified_id"], name: "index_design_iconography_iconifications_on_iconified"
  end

  create_table "design_iconography_icons", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.integer "library_id", null: false
    t.integer "variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_design_iconography_icons_on_library_id"
    t.index ["variant_id"], name: "index_design_iconography_icons_on_variant_id"
  end

  create_table "design_iconography_libraries", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.string "state"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "design_iconography_variants", force: :cascade do |t|
    t.string "name"
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_design_iconography_variants_on_library_id"
  end

  create_table "web_domains", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "name"
    t.string "environment"
    t.boolean "password_protected"
    t.string "username"
    t.string "passphrase"
    t.string "state"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_web_domains_on_site_id"
  end

  create_table "web_pages", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.string "path"
    t.integer "site_id", null: false
    t.integer "parent_id"
    t.integer "position"
    t.boolean "hidden"
    t.string "state"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_web_pages_on_parent_id"
    t.index ["site_id"], name: "index_web_pages_on_site_id"
  end

  create_table "web_sites", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.string "host"
    t.integer "pages_count", default: 0
    t.string "state"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "design_iconography_iconifications", "design_iconography_icons", column: "icon_id"
  add_foreign_key "design_iconography_icons", "design_iconography_libraries", column: "library_id"
  add_foreign_key "design_iconography_icons", "design_iconography_variants", column: "variant_id"
  add_foreign_key "design_iconography_variants", "design_iconography_libraries", column: "library_id"
  add_foreign_key "web_domains", "web_sites", column: "site_id"
  add_foreign_key "web_pages", "web_pages", column: "parent_id", on_delete: :cascade
  add_foreign_key "web_pages", "web_sites", column: "site_id"
end
