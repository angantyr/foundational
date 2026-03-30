class AddDisplayToManagedConfigurationFieldsets < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_fieldsets, :display, :string
  end
end
