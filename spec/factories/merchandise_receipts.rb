FactoryBot.define do
  factory :merchandise_receipt do
    receipt_date { "2022-03-07 11:04:09" }
    unit { :in_ton }

    trait :with_height do
      height { 1.5 }
    end
  end
end
