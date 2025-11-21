class CreateManagedConfigurationNamespaces < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_namespaces do |t|
      t.string :name
      t.integer :position
      t.references :parent, null: true, foreign_key: { to_table: :managed_configuration_namespaces, on_delete: :cascade }
      t.boolean :in_sidemenu, default: true
      t.string :icon_name
      t.timestamps
    end
  end
end
