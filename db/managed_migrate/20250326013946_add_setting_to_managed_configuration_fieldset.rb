class AddSettingToManagedConfigurationFieldset < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_fieldsets, :hide_for_new_records, :boolean, default: false
  end
end
