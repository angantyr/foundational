# This migration comes from web_engine (originally 20240320213755)
class CreateWebDomains < ActiveRecord::Migration[7.1]
  def change
    create_table :web_domains do |t|
      t.references :site, null: false, foreign_key: { to_table: :web_sites }
      t.string :name
      t.string :environment
      t.boolean :password_protected
      t.string :username
      t.string :passphrase
      t.string :state
      t.datetime :published_at

      t.timestamps
    end
  end
end
