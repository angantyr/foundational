class CreateManagedConfigurationDisplayTables < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_display_tables do |t|
      t.references :model, null: false, foreign_key: { to_table: :managed_configuration_models }
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
