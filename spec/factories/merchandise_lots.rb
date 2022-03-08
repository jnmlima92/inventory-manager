FactoryBot.define do
  factory :merchandise_lot do
    name { "merch name" }
    height { 1.5 }
    unit { "in_kilo" }
    inventory { nil }
  end
end
