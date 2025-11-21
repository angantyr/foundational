class AddAutocompleteAttributeToFields < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_fields, :autocomplete_attribute, :string
  end
end
