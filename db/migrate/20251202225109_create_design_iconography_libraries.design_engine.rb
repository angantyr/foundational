# This migration comes from design_engine (originally 20250412152207)
class CreateDesignIconographyLibraries < ActiveRecord::Migration[8.0]
  def change
    create_table :design_iconography_libraries do |t|
      t.string :name
      t.string :permalink
      t.string :state
      t.datetime :published_at

      t.timestamps
    end
  end
end
