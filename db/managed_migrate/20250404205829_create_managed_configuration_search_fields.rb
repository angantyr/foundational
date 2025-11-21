class CreateManagedConfigurationSearchFields < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_search_fields do |t|
      t.string :name
      t.references :fieldset, null: false, foreign_key: { to_table: :managed_configuration_search_fieldsets }
      t.references :property, null: false, foreign_key: { to_table: :managed_configuration_properties }
      t.integer :position

      t.timestamps
    end
  end
end
