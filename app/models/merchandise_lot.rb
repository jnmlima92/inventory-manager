class MerchandiseLot < ApplicationRecord
  belongs_to :inventory
  enum unit: { in_kilo: 0, in_ton: 1 }
end
