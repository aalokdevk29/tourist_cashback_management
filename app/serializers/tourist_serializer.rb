class TouristSerializer < ActiveModel::Serializer
  attribute :cashback, key: :cashback_balance
  
  has_many :purchases, key: :cashback_history
end
