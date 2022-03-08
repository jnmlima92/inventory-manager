class CreateMerchandiseReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandise_receipts do |t|
      t.timestamp :receipt_date
      t.float :height
      t.integer :unit

      t.timestamps
    end
  end
end
