class AddAutocompleteAttributeToModels < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_models, :autocomplete_attribute, :string, default: 'name'
  end
end
