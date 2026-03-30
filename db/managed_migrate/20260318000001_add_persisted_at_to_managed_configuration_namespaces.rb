class AddPersistedAtToManagedConfigurationNamespaces < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_namespaces, :persisted_at, :datetime
  end
end
