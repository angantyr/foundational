class ChangeConfigurationModelPositionToInteger < ActiveRecord::Migration[8.0]
  def change
    if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
      change_column :managed_configuration_models, :position, 'integer USING position::integer'
    else
      change_column :managed_configuration_models, :position, :integer
    end
  end
end

