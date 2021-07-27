class Ticket < ApplicationRecord
  belongs_to :supplier
  has_many :purchase_items
end
