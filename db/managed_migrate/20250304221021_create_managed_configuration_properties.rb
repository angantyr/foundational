class CreateManagedConfigurationProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_configuration_properties do |t|
      t.references :model, null: false, foreign_key: { to_table: :managed_configuration_models }
      t.string :name
      t.string :permalink
      t.string :kind
      t.string :class_name
      t.string :through

      t.timestamps
    end
  end
end
