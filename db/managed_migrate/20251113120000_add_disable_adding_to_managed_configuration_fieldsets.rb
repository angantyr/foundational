class AddDisableAddingToManagedConfigurationFieldsets < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_fieldsets, :disable_adding, :boolean, default: false
  end
end
