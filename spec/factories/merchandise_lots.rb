FactoryBot.define do
  factory :merchandise_lot do
    name { "lot name" }
    height { 1.5 }
    unit { "in_kilo" }
    inventory
    merchandise_receipt
  end
end
