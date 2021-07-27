class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :tourist
      t.integer :payment_type, default: 0
      t.decimal :total_price, precision: 8, scale: 2, default: 0
      t.decimal :cashback_received, precision: 8, scale: 2, default: 0
      t.decimal :cashback_spent, precision: 8, scale: 2, default: 0
      t.timestamps
    end
  end
end