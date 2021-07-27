class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  belongs_to :ticket

  before_create :calculate_total_and_cashback

  def calculate_total
    ticket.price * quantity
  end

  def calculate_cashback
    calculate_total * ticket.cashback / 100 
  end

  private

  def calculate_total_and_cashback
    self.total = calculate_total
    self.cashback = calculate_cashback
  end

end
