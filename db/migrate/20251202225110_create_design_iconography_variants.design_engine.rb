# This migration comes from design_engine (originally 20250412152345)
class CreateDesignIconographyVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :design_iconography_variants do |t|
      t.string :name
      t.references :library, null: false, foreign_key: { to_table: :design_iconography_libraries }
      t.timestamps
    end
  end
end
