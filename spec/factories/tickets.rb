FactoryBot.define do
  factory :ticket do
    place_name { "Place 1" }
    price  { 200 }
    cashback { 4 }
    association :supplier
  end
end
