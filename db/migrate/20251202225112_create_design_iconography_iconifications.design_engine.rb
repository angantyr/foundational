# This migration comes from design_engine (originally 20250412152610)
class CreateDesignIconographyIconifications < ActiveRecord::Migration[8.0]
  def change
    create_table :design_iconography_iconifications do |t|
      t.references :iconified, polymorphic: true, null: false
      t.references :icon, null: false, foreign_key: { to_table: :design_iconography_icons }
      t.timestamps
    end
  end
end
