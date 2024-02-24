class UserExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  validates :user_id, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_save :calculate_individual_tax
  attribute :amount, :float
  attribute :tax_amount, :float

  def adjust_amount
    total_user_expense_amount = expense.user_expenses.sum(:amount)
    expense.amount - total_user_expense_amount
  end

  def calculate_individual_tax
    self.tax_amount = amount * ( self.expense.tax_rate / 100)
  end
end