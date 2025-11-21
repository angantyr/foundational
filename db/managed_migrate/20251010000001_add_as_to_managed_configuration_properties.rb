class AddAsToManagedConfigurationProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_properties, :as, :string
  end
end
