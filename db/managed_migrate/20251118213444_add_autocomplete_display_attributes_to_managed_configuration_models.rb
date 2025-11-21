class AddAutocompleteDisplayAttributesToManagedConfigurationModels < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_models, :autocomplete_title, :string
    add_column :managed_configuration_models, :autocomplete_description, :string
  end
end
