class CreateManagedConfigurationPlugins < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_plugins do |t|
      t.string   :name,         null: false
      t.string   :engine_class, null: false
      t.string   :label,        null: false
      t.string   :description
      t.string   :status,       null: false, default: "pending_setup"
      t.datetime :installed_at
      t.datetime :configured_at
      t.timestamps
    end

    add_index :managed_configuration_plugins, :name, unique: true
  end
end
