FactoryBot.define do
  factory :merchandise_receipt do
    receipt_date { "2022-03-07 11:04:09" }
    height { 1.5 }
    unit { "MyString" }
    merchandise_lot { nil }
  end
end
