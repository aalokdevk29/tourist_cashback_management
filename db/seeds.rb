# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SUPPLIERS = [{ name: 'Supplier 1' }, 
            { name: 'Supplier 2' }, 
            { name: 'Supplier 3' }]


TICKETS = [{ place_name: 'Ecological Park', price: 100, cashback: 2 },
  { place_name: 'Rio da Prata', price: 200, cashback: 3 },
  { place_name: 'Myterious Lagoon', price: 150, cashback: 0 }]


TOURISTS = [{ name: 'Tourist 1', email: 'tourist1@yopmail.com' },
            { name: 'Tourist 2', email: 'tourist2@yopmail.com' }]

PURCHASES = [[{ }
], []]

Supplier.destroy_all
Ticket.destroy_all
Tourist.destroy_all
# create_suppliers
# create_tickets
# create_tourists
# create_purchases

Supplier.create(SUPPLIERS)

suppliers = Supplier.all
TICKETS.each_with_index do |ticket, idx|
  ticket[:supplier] = suppliers[idx]
end
Ticket.create(TICKETS)

Tourist.create(TOURISTS)

purchase1 = Tourist.first.purchases.new
Ticket.all.each do |ticket|
  purchase1.purchase_items.build(ticket: ticket, 
    quantity: 2, unit_price: ticket.price)
end
purchase1.save

purchase1.calculate_cashback_received_and_total

purchase1.save

purchase2 = Tourist.first.purchases.new
[Ticket.first, Ticket.last].each do |ticket|
  purchase2.purchase_items.build(ticket: ticket, 
    quantity: 3, unit_price: ticket.price)
end
purchase2.save

purchase2.calculate_cashback_received_and_total

purchase2.save