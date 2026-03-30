class AddPluginToManagedConfigurationNamespaces < ActiveRecord::Migration[8.0]
  def change
    add_reference :managed_configuration_namespaces, :plugin,
                  foreign_key: { to_table: :managed_configuration_plugins },
                  null: true
  end
end
