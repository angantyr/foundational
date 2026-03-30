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

ActiveRecord::Schema[8.0].define(version: 2026_03_18_000001) do
  create_table "managed_account_filters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "description"
    t.string "path"
    t.text "params"
    t.boolean "shared", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_managed_account_filters_on_user_id"
  end

  create_table "managed_account_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "language"
    t.string "time_zone"
    t.integer "role"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managed_configuration_display_columns", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "table_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_managed_configuration_display_columns_on_property_id"
    t.index ["table_id"], name: "index_managed_configuration_display_columns_on_table_id"
  end

  create_table "managed_configuration_display_tables", force: :cascade do |t|
    t.integer "model_id", null: false
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_managed_configuration_display_tables_on_model_id"
  end

  create_table "managed_configuration_fields", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "fieldset_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "autocomplete_attribute"
    t.boolean "immutable", default: false
    t.index ["fieldset_id"], name: "index_managed_configuration_fields_on_fieldset_id"
    t.index ["property_id"], name: "index_managed_configuration_fields_on_property_id"
  end

  create_table "managed_configuration_fieldsets", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.integer "model_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hide_for_new_records", default: false
    t.boolean "disable_adding", default: false
    t.string "display"
    t.index ["model_id"], name: "index_managed_configuration_fieldsets_on_model_id"
  end

  create_table "managed_configuration_models", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.boolean "in_sidemenu"
    t.boolean "in_add_menu"
    t.json "table_column_attributes"
    t.json "sort_columns"
    t.string "sort_column_default"
    t.string "sort_direction_default"
    t.integer "page_count_default"
    t.json "page_count_options"
    t.json "displays_available"
    t.string "display_default"
    t.json "workflow_scopes"
    t.json "available_scopes"
    t.boolean "date_range_filter"
    t.json "date_range_attributes"
    t.json "filter_fields"
    t.json "diagnostic_scopes"
    t.string "workflow_scope_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "namespace_id"
    t.string "autocomplete_attribute", default: "name"
    t.string "autocomplete_title"
    t.string "autocomplete_description"
    t.index ["namespace_id"], name: "index_managed_configuration_models_on_namespace_id"
  end

  create_table "managed_configuration_namespaces", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "parent_id"
    t.boolean "in_sidemenu", default: true
    t.string "icon_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plugin_id"
    t.datetime "persisted_at"
    t.index ["parent_id"], name: "index_managed_configuration_namespaces_on_parent_id"
    t.index ["plugin_id"], name: "index_managed_configuration_namespaces_on_plugin_id"
  end

  create_table "managed_configuration_plugins", force: :cascade do |t|
    t.string "name", null: false
    t.string "engine_class", null: false
    t.string "label", null: false
    t.string "description"
    t.string "status", default: "pending_setup", null: false
    t.datetime "installed_at"
    t.datetime "configured_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_managed_configuration_plugins_on_name", unique: true
  end

  create_table "managed_configuration_properties", force: :cascade do |t|
    t.integer "model_id", null: false
    t.string "name"
    t.string "permalink"
    t.string "kind"
    t.string "class_name"
    t.string "through"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "as"
    t.index ["model_id"], name: "index_managed_configuration_properties_on_model_id"
  end

  create_table "managed_configuration_search_fields", force: :cascade do |t|
    t.string "name"
    t.integer "fieldset_id", null: false
    t.integer "property_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "collection_strategy", default: 0
    t.integer "tom_select_mode", default: 0
    t.integer "count_threshold", default: 100
    t.string "label"
    t.string "placeholder"
    t.string "hint"
    t.boolean "money", default: false
    t.index ["fieldset_id"], name: "index_managed_configuration_search_fields_on_fieldset_id"
    t.index ["property_id"], name: "index_managed_configuration_search_fields_on_property_id"
  end

  create_table "managed_configuration_search_fieldsets", force: :cascade do |t|
    t.string "name"
    t.integer "model_id", null: false
    t.integer "purpose"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_managed_configuration_search_fieldsets_on_model_id"
  end

  create_table "managed_configuration_settings", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.boolean "sidemenu", default: true
    t.boolean "addmenu", default: true
    t.boolean "search", default: true
    t.boolean "notifications", default: true
    t.boolean "account", default: true
    t.string "disclaimer"
    t.string "copyright"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "managed_account_filters", "managed_account_users", column: "user_id"
  add_foreign_key "managed_configuration_display_columns", "managed_configuration_display_tables", column: "table_id"
  add_foreign_key "managed_configuration_display_columns", "managed_configuration_properties", column: "property_id"
  add_foreign_key "managed_configuration_display_tables", "managed_configuration_models", column: "model_id"
  add_foreign_key "managed_configuration_fields", "managed_configuration_fieldsets", column: "fieldset_id"
  add_foreign_key "managed_configuration_fields", "managed_configuration_properties", column: "property_id"
  add_foreign_key "managed_configuration_fieldsets", "managed_configuration_models", column: "model_id"
  add_foreign_key "managed_configuration_models", "managed_configuration_namespaces", column: "namespace_id"
  add_foreign_key "managed_configuration_namespaces", "managed_configuration_namespaces", column: "parent_id", on_delete: :cascade
  add_foreign_key "managed_configuration_namespaces", "managed_configuration_plugins", column: "plugin_id"
  add_foreign_key "managed_configuration_properties", "managed_configuration_models", column: "model_id"
  add_foreign_key "managed_configuration_search_fields", "managed_configuration_properties", column: "property_id"
  add_foreign_key "managed_configuration_search_fields", "managed_configuration_search_fieldsets", column: "fieldset_id"
  add_foreign_key "managed_configuration_search_fieldsets", "managed_configuration_models", column: "model_id"
end
