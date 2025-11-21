class AddMoneyToSearchFields < ActiveRecord::Migration[8.0]
  def change
    add_column :managed_configuration_search_fields, :money, :boolean, default: false
  end
end
