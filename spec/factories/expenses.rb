FactoryBot.define do
  factory :expense do
    description { Faker::Lorem.sentence }
    amount { Faker::Number.decimal(l_digits: 2) }
    payer { association :user }
    split_equally { [true, false].sample }
    tax_rate { Faker::Number.decimal(l_digits: 2) }
  end
end