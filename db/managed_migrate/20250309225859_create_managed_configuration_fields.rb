class CreateManagedConfigurationFields < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_fields do |t|
      t.string :name
      t.integer :position
      t.references :fieldset, null: false, foreign_key: { to_table: :managed_configuration_fieldsets }
      t.references :property, null: false, foreign_key: { to_table: :managed_configuration_properties }

      t.timestamps
    end
  end
end
