class Inventory < ApplicationRecord
  validates_presence_of :name
  has_many :merchandise_lots
end
