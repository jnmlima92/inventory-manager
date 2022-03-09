class MerchandiseReceipt < ApplicationRecord
  validates_presence_of :receipt_date, :height, :unit

  has_many :merchandise_lots
  enum unit: { in_kilo: 0, in_ton: 1 }
  
  before_validation :sum_height
  accepts_nested_attributes_for :merchandise_lots

  def sum_height
    total_height = 0
    merchandise_lots.each { |lot| total_height += lot.height }
    
    self.height = total_height
  end
end
