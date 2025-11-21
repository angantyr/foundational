class CreateManagedConfigurationSearchFieldsets < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_search_fieldsets do |t|
      t.string :name
      t.references :model, null: false, foreign_key: { to_table: :managed_configuration_models }
      t.integer :purpose
      t.integer :position

      t.timestamps
    end
  end
end
