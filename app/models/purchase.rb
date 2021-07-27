class Purchase < ApplicationRecord
  belongs_to :tourist
  has_many :purchase_items, dependent: :destroy

  enum payment_type: [:credit_card, :debit_card]

  before_save :update_cashback

  def calculate_cashback_received
    cashback = purchase_items.map(&:cashback).compact.sum
    cashback = cashback + total_price * 1 / 100 if credit_card?
    cashback
  end

  def calculate_total
    purchase_items.map(&:total).compact.sum
  end

  def calculate_cashback_received_and_total
    self.total_price = calculate_total
    self.cashback_received = calculate_cashback_received
  end

  private

  def update_cashback
    self.tourist.increment!(:cashback, cashback_received) if self.cashback_received_changed?
    self.tourist.decrement!(:cashback, cashback_spent) if self.cashback_spent_changed?
  end
end
