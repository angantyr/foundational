class AddNamespaceToManagedConfigurationModel < ActiveRecord::Migration[8.0]
  def change
    remove_column :managed_configuration_models, :namespace
    add_reference :managed_configuration_models, :namespace, null: true, foreign_key: { to_table: :managed_configuration_namespaces }
  end
end
