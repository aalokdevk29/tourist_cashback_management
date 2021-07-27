require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { Purchase.reflect_on_association(:tourist).macro.should eq(:belongs_to) }
  it { Purchase.reflect_on_association(:purchase_items).macro.should eq(:has_many) }

  let(:supplier) { create :supplier }
  let(:tourist) { create :tourist }

  describe 'methods' do
    before do 
      3.times {|i| create :ticket, supplier: supplier, cashback: 2*i, place_name: "Ticket#{i}" }
      tickets = Ticket.all
      @purchase = build :purchase, tourist: tourist
      3.times {|i|  create :purchase_item, purchase: @purchase, unit_price: tickets[i].price,
        ticket: tickets[i] }
    end

    it 'should return cashback received' do
      @purchase.total_price = @purchase.calculate_total
      cashback_received = @purchase.calculate_cashback_received
      expect(cashback_received.to_f).to eq 36
    end

    it 'should return total' do
      total = @purchase.calculate_total
      expect(total.to_f).to eq 1200 
    end

    it 'should update tourist cashback' do
      expect(@purchase.tourist.cashback).to eq 0
      @purchase.calculate_cashback_received_and_total
      @purchase.save
      expect(@purchase.tourist.cashback.to_f).to eq 36
    end
  end

end
