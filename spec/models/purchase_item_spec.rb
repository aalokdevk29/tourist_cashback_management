require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  it { PurchaseItem.reflect_on_association(:purchase).macro.should eq(:belongs_to) }
  it { PurchaseItem.reflect_on_association(:ticket).macro.should eq(:belongs_to) }

  describe 'methods & callbacks' do
    let(:supplier) { create :supplier }
    let(:tourist) { create :tourist }
    let(:ticket) { create :ticket, supplier: supplier }
    let(:purchase) { create :purchase, tourist: tourist }
    let(:purchase_item) { build :purchase_item, purchase: purchase, ticket: ticket }

    context 'methods' do
      it 'should return cashback received' do
        cashback = purchase_item.calculate_cashback
        expect(cashback.to_f).to eq 16
      end

      it 'should return total' do
        total = purchase_item.calculate_total
        expect(total.to_f).to eq 400
      end    
    end

    context 'callbacks' do
      it 'should update cashback and total in db' do
        expect(purchase_item.cashback).to  eq 0
        expect(purchase_item.total).to  eq 0
        purchase_item.save
        expect(purchase_item.cashback).to  eq 16
        expect(purchase_item.total).to  eq 400
      end
    end
  end

end
