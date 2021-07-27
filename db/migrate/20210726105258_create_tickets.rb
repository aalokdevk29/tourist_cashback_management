class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :supplier
      t.string :place_name
      t.decimal :price, precision: 8, scale: 2, default: 0
      t.integer :cashback, default: 0

      t.timestamps
    end
  end
end
