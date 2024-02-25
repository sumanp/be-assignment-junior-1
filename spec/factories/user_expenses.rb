FactoryBot.define do
  factory :user_expense do
    association :user
    association :expense
    amount { 50 }
    tax_amount { 5 }
  end
end