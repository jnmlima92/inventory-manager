class CreateMerchandiseReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandise_receipts do |t|
      t.timestamp :receipt_date
      t.float :height
      t.string :unit
      t.references :merchandise_lot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
