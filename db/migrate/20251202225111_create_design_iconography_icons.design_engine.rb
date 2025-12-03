# This migration comes from design_engine (originally 20250412152422)
class CreateDesignIconographyIcons < ActiveRecord::Migration[8.0]
  def change
    create_table :design_iconography_icons do |t|
      t.string :name
      t.string :permalink
      t.references :library, null: false, foreign_key: { to_table: :design_iconography_libraries }
      t.references :variant, null: true, foreign_key: { to_table: :design_iconography_variants }

      t.timestamps
    end
  end
end
