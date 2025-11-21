class CreateManagedConfigurationSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :managed_configuration_settings do |t|
      t.string :name
      t.string :logo
      t.boolean :sidemenu, default: true
      t.boolean :addmenu, default: true
      t.boolean :search, default: true
      t.boolean :notifications, default: true
      t.boolean :account, default: true
      t.string :disclaimer
      t.string :copyright

      t.timestamps
    end
  end
end
