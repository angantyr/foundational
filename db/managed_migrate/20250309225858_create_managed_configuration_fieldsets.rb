class CreateManagedConfigurationFieldsets < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_fieldsets do |t|
      t.string :name
      t.text :summary
      t.references :model, null: false, foreign_key: { to_table: :managed_configuration_models }
      t.integer :position

      t.timestamps
    end
  end
end
