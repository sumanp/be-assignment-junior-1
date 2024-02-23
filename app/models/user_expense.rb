class UserExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  validates :user_id, presence: true
  validates :expense_id, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  attribute :amount, :float
  attribute :tax_amount, :float
end