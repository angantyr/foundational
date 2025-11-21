class CreateManagedConfigurationModels < ActiveRecord::Migration[7.1]
  def change
    create_table :managed_configuration_models do |t|
      t.string :name
      t.string :namespace
      t.string :position
      t.boolean :in_sidemenu
      t.boolean :in_add_menu
      t.json :table_column_attributes
      t.json :sort_columns
      t.string :sort_column_default
      t.string :sort_direction_default
      t.integer :page_count_default
      t.json :page_count_options
      t.json :displays_available
      t.string :display_default
      t.json :workflow_scopes
      t.json :available_scopes
      t.boolean :date_range_filter
      t.json :date_range_attributes
      t.json :filter_fields
      t.json :diagnostic_scopes
      t.string :workflow_scope_default

      t.timestamps
    end
  end
end
