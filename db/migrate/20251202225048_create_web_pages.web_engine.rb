# This migration comes from web_engine (originally 20240320213436)
class CreateWebPages < ActiveRecord::Migration[7.1]
  def change
    create_table :web_pages do |t|
      t.string :name
      t.string :permalink
      t.string :path
      t.references :site, null: false, foreign_key: { to_table: :web_sites }
      t.references :parent, null: true, foreign_key: { to_table: :web_pages, on_delete: :cascade }
      t.integer :position
      t.boolean :hidden
      t.string :state
      t.datetime :published_at

      t.timestamps
    end
  end
end
