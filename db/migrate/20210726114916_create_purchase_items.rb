class CreatePurchaseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_items do |t|
      t.references :purchase
      t.references :ticket
      t.integer :quantity
      t.decimal :unit_price, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.decimal :cashback, precision: 8, scale: 2
      t.timestamps
    end
  end
end