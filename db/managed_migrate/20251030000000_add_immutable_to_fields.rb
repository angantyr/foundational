class AddImmutableToFields < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_fields, :immutable, :boolean, default: false
  end
end
