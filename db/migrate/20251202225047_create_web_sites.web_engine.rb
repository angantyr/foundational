# This migration comes from web_engine (originally 20240320213012)
class CreateWebSites < ActiveRecord::Migration[7.1]
  def change
    create_table :web_sites do |t|
      t.string :name
      t.string :permalink
      t.string :host
      t.integer :pages_count, default: 0
      t.string :state
      t.datetime :published_at

      t.timestamps
    end
  end
end
