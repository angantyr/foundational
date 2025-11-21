class CreateManagedAccountUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :managed_account_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      
      t.string :language
      t.string :time_zone
      
      t.integer :role
      t.string :state

      t.timestamps
    end
  end
end
