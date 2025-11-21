class CreateManagedAccountFilters < ActiveRecord::Migration[8.0]
  def change
    create_table :managed_account_filters do |t|
      t.references :user, null: false, foreign_key: { to_table: :managed_account_users }
      t.string :name
      t.string :description
      t.string :path
      t.text :params
      t.boolean :shared, default: false

      t.timestamps
    end
  end
end
