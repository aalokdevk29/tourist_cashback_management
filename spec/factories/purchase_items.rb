FactoryBot.define do
  factory :purchase_item do
    quantity { 2 }
    association :ticket
    association :purchase
  end
end
