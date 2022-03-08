class CreateMerchandiseLots < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandise_lots do |t|
      t.string :name, null: false
      t.float :height, null: false
      t.integer :unit, null: false
      t.references :inventory, null: true, foreign_key: true
      t.references :merchandise_receipt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
