class Tourist < ApplicationRecord
  has_many :purchases, dependent: :destroy
end
