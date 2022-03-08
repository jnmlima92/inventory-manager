class MerchandiseLot < ApplicationRecord
  validates_presence_of :name, :height, :unit
  belongs_to :inventory
  belongs_to :merchandise_receipt
  enum unit: { in_kilo: 0, in_ton: 1 }
end
