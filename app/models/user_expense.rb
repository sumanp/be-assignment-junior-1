class UserExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  attribute :amount, :float
  attribute :tax_amount, :float
end