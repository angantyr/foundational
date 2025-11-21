class AddRenderingConfigToSearchFields < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_search_fields, :collection_strategy, :integer, default: 0
    add_column :managed_configuration_search_fields, :tom_select_mode, :integer, default: 0
    add_column :managed_configuration_search_fields, :count_threshold, :integer, default: 100
    add_column :managed_configuration_search_fields, :label, :string
    add_column :managed_configuration_search_fields, :placeholder, :string
    add_column :managed_configuration_search_fields, :hint, :string
  end
end
