class CreateManagedConfigurationDisplayColumns < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_display_columns do |t|
      t.string :name
      t.integer :position
      t.references :table, null: false, foreign_key: { to_table: :managed_configuration_display_tables }
      t.references :property, null: false, foreign_key: { to_table: :managed_configuration_properties }

      t.timestamps
    end
  end
end
