class PurchaseSerializer < ActiveModel::Serializer
  attributes :cashback_received, :cashback_spent
  attribute :created_at, key: :date
 end
