class CreateTourists < ActiveRecord::Migration[6.1]
  def change
    create_table :tourists do |t|
      t.string :name
      t.string :email
      t.decimal :cashback, precision: 8, scale: 2, default: 0
      t.timestamps
    end
  end
end
